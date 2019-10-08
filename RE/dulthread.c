//
//  dulthread.c
//  dulang
//
//  Created by Дмитрий Маслюков on 13/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../INCLUDE/dulthread.h"
#include "../buildscript.h"
#include <math.h>
#include <ctype.h>
#include <unistd.h>
#include "../api.h"
#include <pthread.h>
struct thread work_pool[numthreads];

struct thread*less_loaded = work_pool;
volatile struct thread*current_thread = work_pool;


void destroy_coro(struct _crt*c){
    //free(c);
}

int exec_coro(struct _crt*coroutine){
    switch(coroutine->state){
        case coro_running:{
            context* c = coroutine->sttop;
            if(exec_context(c)){
                //context is finished
                context* next = c->return_to;
                //destroy_context(c);
                if(next)
                    coroutine->sttop = next;
                else {
                    return coroutine->state = coro_finished;
                }
            }
            return coro_running;
        } break;
        case coro_finished:{
            return coro_finished;
        } break;
        default:
            return coroutine->state;
            break;
    }
}

struct _crt * start_coro( struct thread* thr, funcobject* func ) {
    struct _crt * coro = (struct _crt *) dulalloc( sizeof( struct _crt));
    if( coro == NULL ) {
        fprintf( stderr, "Can't allocate new coro\n" );
        exit( 1 );
    }
    
    coro->sttop  = NULL;
    coro->state  = coro_running;
    context* ctx = init_context( func, coro );
    (void) ctx;
    if( thr->workload ++ == 0 ) {
        // First coroutine
        thr->current = coro;
        coro->next   = coro;
        coro->prev   = coro;
        return coro;
    }

    struct _crt *before = thr->current;
    struct _crt *after  = thr->current->next;
    
    coro->next = after;
    coro->prev = before;
    before->next = coro;
    after->prev  = coro;
    return coro;
}




int exec_thread(void){
    struct _crt* coro = current_thread->current;
    if(!(coro->state == coro_waiting)){
        if(exec_coro(coro) == coro_finished){
            switch (current_thread->workload) {
                case 0:
                    return 0;
                case 1:
                    destroy_coro(current_thread->current);
                    return current_thread->workload = 0;
                default:{
                    struct _crt* prev = coro->prev;
                    struct _crt* next = coro->next;
                    prev->next = next;
                    next->prev = prev;
                    destroy_coro(coro);
                    current_thread->current = coro->next;
                    return --current_thread->workload;
                }break;
            }
        }
    }
    
    current_thread->current = coro->next;
    return current_thread->workload;
}


void thread_error(char * errmsgfmt, ...){
    struct _crt * coro = current_thread->current;
    context * problematic = coro->sttop;
    va_list argList;
    va_start(argList, errmsgfmt);
    fprintf(stderr, errmsgfmt, argList);
    while(problematic){
    }
    va_end(argList);
}

void decref_thread_workload(dulthread * t){
    t->workload--;
    if(!t->workload){
        pthread_cond_signal(&t->empty);
    }
}


void exec_thread_(dulthread * t){
    pthread_mutex_init(&t->mutex, 0);
    pthread_cond_init(&t->empty, 0);
    
get_coro:;
    int codes_block = 0;
    while(!t->workload){
        if(final_context)
            pthread_exit(0);
        pthread_cond_wait(&t->empty, &t->mutex);
    }
    const int _lock_null = 0;
    const int _lock_one = 1;
    do{
        t->current = t->current->next;
    }while(t->current->state != coro_running);
    
    atomic_store(&t->coro_lock, 0);
ctx_exec:;
    context * ctx = t->current->sttop;
    if(!ctx)
        goto get_coro;
    if(codes_block > 100 && t->workload != 1)
        goto get_coro;
    struct op * _op = ctx->inst_pointer++;
    codes_block++;
    const funcobject * co_static = ctx->co_static;
        if(ctx->cur_expr)
            co_static = ctx->cur_expr->inlined_in;
    #if print_opcode_run
        int i_ptr;
        if(ctx->cur_expr){
            i_ptr = ctx->inst_pointer - ctx->cur_expr->ops;
        } else {
            i_ptr = ctx->inst_pointer - ctx->co_static->byteops;
        }
        printf("executing %2d opcode at %10lX: %*s : %d\n", i_ptr, (unsigned long)ctx, 20, opcode_repres_[_op->op_code], _op->arg);
    #endif
        switch (_op->op_code) {
            case store_name:{
                object * o =ctx->vars[_op->arg];
                if(o && !isInt(o))
                    DECREF(ctx->vars[_op->arg]);
                o = *--ctx->stackptr;
                ctx->vars[_op->arg] = o;
                if(o)
                    INCREF(o);
    #if print_opcode_run
                if(ctx->vars[_op->arg] && ctx->vars[_op->arg]->type->dump){
                    char* dumpvar = ctx->vars[_op->arg]->type->dump(ctx->vars[_op->arg]);
                    printf("%*s = %s\n", 10, ctx->co_static->varnames[ _op->arg ], dumpvar );
                    free(dumpvar);
                }
                
    #endif
            }break;
            case store_iter:{
                //actually is same as store_name but w/o INCREF-DECREF
                ctx->vars[_op->arg] = *--ctx->stackptr;
            }break;
            case load_name:{
                //vars is first field is context so it matches its address
                *ctx->stackptr++ = ctx->vars[_op->arg];
                goto ctx_exec;
            }break;
            case load_static:
                *ctx->stackptr++ = ctx->co_static->statics[_op->arg];
                goto ctx_exec;
                break;
            case _write:{
                    object* sttop = *--ctx->stackptr;
                    if((long)sttop & 1){
                        //smallint;
                        int intrepr[2];
                        memcpy(&sttop, intrepr, sizeof(object*));
                        printf("%d\n", intrepr[0]);
                        break;
                    }
                    if(!sttop){
                        printf("null\n");
                    } else {
                        
    #if use_writer
                        binarg a;
                        a.aptr = ctx->stackptr -= _op->arg - 1;
                        a.a_passed = _op->arg;
                        push((object*)ctx->writer, a, ctx);
    #else
                        printf("%s\n", dump);
    #endif
                        
                    }
                    

            }break;
            case jump_if_not_true:{
                object* b = *--ctx->stackptr;
                if(!b){
                    ctx->inst_pointer += _op->arg;
                    break;
                }
                if(b->type == &BOOLTYPE)
                    if(!((dulbool*)b)->val)
                        ctx->inst_pointer += _op->arg;
                goto ctx_exec;
                }break;
            case jump:
                ctx->inst_pointer+= _op->arg;
                goto ctx_exec;
                break;
            case funcdef:{
                funcobject * generic = (funcobject*)ctx->co_static->statics[_op->arg];
                funcobject * new_object = malloc(sizeof(funcobject));
                memcpy(new_object, generic, sizeof(funcobject));
                new_object->outer_context = ctx;
                *ctx->stackptr++ = (object*)new_object;
                goto ctx_exec;
            }break;
            case load_outer:{
                int a = _op->arg;
                int levels = ( a >> 16 );
                int mask   = ( 1 << 16 ) - 1;
                int offset = ( a & mask ) - 1;
                context*c = ctx->co_static->outer_context;
                while( levels > 0 && c != NULL ) {
                    c = c->return_to;
                    levels --;
                }
                if(c)
                    *ctx->stackptr++ = c->vars[offset];
                goto ctx_exec;
                }break;
            case invoke:{
                object* sttop = *--ctx->stackptr;
                if(!sttop){
                    fprintf(stderr, "null pointer exception: cannot invoke a nulled object\n");
                    break;
                }
                if(sttop->type->type_id == method_id){
                    object * fun = ((dulmethod*)sttop)->executable;
                    object * self = ((dulmethod*)sttop)->instance;
                    if(fun->type->type_id == func_id){
                        context* c = init_context((funcobject*)fun, ctx->coroutine);
                        //*++ctx->stackptr = 0;
                        //object* args = *--ctx->stackptr;
                        if(((funcobject*)fun)->argcount != _op->arg){
                            fprintf(stderr, "in function %d parameter passed but %d expected\n",
                                    _op->arg, ((funcobject*)fun)->argcount);
                        }
                        for(int i = ((funcobject*)fun)->argcount - 1; i>=0; --i){
                            c->vars[i] = *--ctx->stackptr;
                            INCREF(c->vars[i]);
                        }
                        for(int i = 0; i<((funcobject*)fun)->namecount; ++i)
                            if(strcmp(((funcobject*)fun)->varnames[i], "this")==0){
                                INCREF(self);
                                c->vars[i] = self;
                                c->this_ptr = self;
                            }
                    }
                }
                if(sttop->type == &EXPRTYPE){
                    exprobject* expr = (exprobject*)sttop;
                    expr->return_to = ctx->inst_pointer;
                    ctx->cur_expr = expr;
                    ctx->inst_pointer = expr->ops;
                    ctx->stop_ptr = expr->ops + expr->bytecount;
                    break;
                }
                if(sttop->type->type_id == func_id){
                    context* c = init_context((funcobject*)sttop, ctx->coroutine);
                    //*++ctx->stackptr = 0;
                    //object* args = *--ctx->stackptr;
                    if(((funcobject*)sttop)->argcount != _op->arg){
                        fprintf(stderr, "in function %d parameter passed but %d expected\n",
                            _op->arg, ((funcobject*)sttop)->argcount);
                    }
                    for(int i = ((funcobject*)sttop)->argcount - 1; i>=0; --i)
                        c->vars[i] = *--ctx->stackptr;
                    
                }
                if(sttop->type->type_id == bin_func_id){
                    
                    builtin_func* f = (builtin_func*)sttop;
                    binarg Args = {ctx->stackptr -= _op->arg, _op->arg};
                    *ctx->stackptr++ = f->func_pointer(Args, ctx);
                    //DECREF(args);
                    
                }
               
                if(sttop->type->type_id == object_id){
                    if(_op->arg == 0){
                        //is invoked as constructor
                        object * o = new_ob();
                        single_ob * self = (single_ob*)sttop;
                        for(int i = 0; i< self->shape->cap; ++i){
                            if(self->shape->fieldnames[i]){
                                ob_subscr_set(o, self->shape->fieldnames[i], self->f_values[i]);
                            }
                        }
                        *ctx->stackptr++ = o;
                        break;
                    }
                    object* args = *--ctx->stackptr;
                    /*Это костыль*/
                    
                    funcobject* r_func_arg = (funcobject*)args;
                    //dumpfunc(r_func_arg);
                    context* c = init_context(r_func_arg, ctx->coroutine);
                    
                    int this_pos = -1;
                    for(int i = 0; i<r_func_arg->namecount; ++i){
                        if(strcmp("this", r_func_arg->varnames[i]) == 0){
                            this_pos = i;
                            break;
                        }
                    }
                    
                    if(this_pos != -1){
                        c->vars[this_pos] = (object*)sttop;
                        c->this_ptr      = sttop;
                        
                    }
                }
            } break;
            case dulreturn:
                if(ctx->return_to){
    
                    object* return_result = *--ctx->stackptr;
                    if(return_result) INCREF(return_result);
                    *(ctx->return_to->stackptr)++ = return_result;
                } else {
                    //unlink coro!
                    struct _crt * coro = ctx->coroutine;
                    while(atomic_compare_exchange_weak(&coro->t->coro_lock, &_lock_null, &_lock_one));
                    struct _crt * next = coro->next;
                    struct _crt * prev = coro->prev;
                    next->prev = prev;
                    prev->next = next;
                    decref_thread_workload(t);
                    destroy_coro(coro);
                    atomic_store(&coro->t->coro_lock, 0);
                }
                ctx->coroutine->sttop = ctx->return_to;
                goto get_coro;
                break;
            case mktuple:{
                object*o = _mktuple(ctx->stackptr, _op->arg);
                ctx->stackptr -= _op->arg;
                *ctx->stackptr++ = o;
            } break;
            case check_iter:{
                if(!ctx->stackptr[-1]){
                    ctx->inst_pointer += _op->arg;
                }
            } break;
            case unpack_iter:{
                object*iter = ctx->vars[_op->arg];
                *ctx->stackptr++ = iter->type->unpack_iter(iter);
            } break;
            case iter_next:{
                object* it = ctx->vars[_op->arg];
                ctx->stackptr = ctx->stack_to_revert;
                *ctx->stackptr++ = it->type->iter_next(it);
                ctx->vars[_op->arg] = *(ctx->stackptr - 1);
                goto ctx_exec;
            } break;
            case init_iter:{
                object*coll = *--ctx->stackptr;
                ctx->stack_to_revert = ctx->stackptr;
                *ctx->stackptr++ = coll->type->init_iter(coll);
                ctx->vars[_op->arg] = *(ctx->stackptr -1);
            } break;
            case op_plus:{
                object*right = *--ctx->stackptr;
                object*left = *--ctx->stackptr;
                
                if(isInt(left) && isInt(right)){
                    //left is smallInt and right is smallInt
                    *ctx->stackptr++ = dulIntPlusInt(left, right);
                    break;
                }
                
                void* fptr = left->type->plus_op;
                if(fptr)
                    *ctx->stackptr++ = left->type->plus_op(left, right);
                else
                    fprintf(stderr, "cannot add to %s type\n", left->type->name);
            } break;
            case op_minus:{
                object*right = *--ctx->stackptr;
                object*left = *--ctx->stackptr;
                
                void* fptr = left->type->minus_op;
                if(fptr)
                    *ctx->stackptr++ = left->type->minus_op(left, right);
                else
                    fprintf(stderr, "cannot sub from %s type\n", left->type->name);
            } break;
            case op_mult:{
                object*right = *--ctx->stackptr;
                object*left = *--ctx->stackptr;

                void* fptr = left->type->mult_op;
                if(fptr)
                    *ctx->stackptr++ = left->type->mult_op(left, right);
                else
                    fprintf(stderr, "cannot mult %s type\n", left->type->name);
            } break;
            case op_div:{
                object*right = *--ctx->stackptr;
                object*left = *--ctx->stackptr;
               
                void* fptr = left->type->div_op;
                if(fptr)
                    *ctx->stackptr++ = left->type->div_op(left, right);
                else
                    fprintf(stderr, "cannot div %s type\n", left->type->name);
            }break;
            case invoke_method:{
                //UNSAFE
                object* self = *--ctx->stackptr;
                object* method_name = *--ctx->stackptr;
                //object* arg = *--ctx->stackptr;
                if(self->type->get_methods == 0){
                    //try to get as member
                    if(strcmp(method_name->type->name, "string")==0){
                        dulstring* s = (dulstring*)method_name;
                        object* method_ob = self->type->subscript_get(self, (object*)s);
                        //methodob typecheck
                        if(!method_ob){
                            break;
                        }
                        if(strcmp(method_ob->type->name, "builtin")==0){
    #warning TODO: this pass
                            binarg a;
                            a.a_passed = _op->arg;
                            a.aptr = ctx->stackptr -= a.a_passed;
                            *ctx->stackptr++ = ((builtin_func*)method_ob)->func_pointer(a, ctx);
                            break;
                        }
                        if(method_ob->type->type_id == method_id){
                            method_ob = ((dulmethod*)method_ob)->executable;
                        }
                        if(strcmp(method_ob->type->name, "functional object")==0){
                            context* c = init_context((funcobject*)method_ob, ctx->coroutine );
                            if(_op->arg != ((funcobject*)method_ob)->argcount){
                                fprintf(stderr, "cannot invoke method of not string type: %s\n", method_name->type->name);
                                break;
                            }
                            for(int i = 0; i<((funcobject*)method_ob)->argcount; ++i)
                                c->vars[i] = *--ctx->stackptr;
                            for(int i = 0; i<((funcobject*)method_ob)->namecount; ++i){
                                if(strcmp("this", ((funcobject*)method_ob)->varnames[i]) == 0){
                                    c->vars[i] = self;
                                    c->this_ptr = self;
                                    break;
                                }
                            }
                        }
                        
                    } else {
                        fprintf(stderr, "cannot invoke method of not string type: %s\n", method_name->type->name);
                    }
                } else {
                    if(method_name->type->type_id != string_id){
                        fprintf(stderr, "cannot invoke method of expression type %s", method_name->type->name);
                        break;
                    }
                    binarg a;
                    a.a_passed = _op->arg;
                    a.aptr = ctx->stackptr -= a.a_passed;
                    dulstring* m_name_casted = (dulstring*)method_name;
                    object * method_ob = ob_subscr_get(self->type->get_methods(), (object*)m_name_casted);
                    if(method_ob->type->type_id == bin_func_id)
                        *ctx->stackptr++ = ((bin_method*)method_ob)->func_pointer(self, a, ctx);
                    else{
                        if(method_ob->type->type_id == method_id)
                            method_ob = ((dulmethod*)method_ob)->executable;
                        context * c = init_context(method_ob, ctx->coroutine);
                        for(int i = 0; i<((funcobject*)method_ob)->argcount; ++i)
                            c->vars[i] = a.aptr[i];
                        for(int i = 0; i<((funcobject*)method_ob)->namecount; ++i){
                            if(strcmp("this", ((funcobject*)method_ob)->varnames[i]) == 0){
                                c->vars[i] = self;
                                c->this_ptr = self;
                                break;
                            }
                        }
                    }
                }
                
                
                
            }break;
            case _subscr_get:{
                object* o = *--ctx->stackptr;
                object* subscribant = *--ctx->stackptr;
                *ctx->stackptr++ = o->type->subscript_get(o, subscribant);
               
            }break;
            case load_stat_subscr:{
                object * o = *--ctx->stackptr;
                if(!o){
                    break;
                }
                if(o->type->type_id == object_id){
                    //can be inline cached
                    single_ob * obj = (single_ob*)o;
                    if((object*)obj->shape == _op->opcache[0]){
                        //if cache matches previous operand
                        long pos = (long)_op->opcache[1];
                        *ctx->stackptr++ = ob_sub_offt(obj, pos);
                    } else {
                        _op->opcache[0] = (object*)obj->shape;
                        long pos = dulshape_get_offset(obj->shape, ctx->co_static->statics[_op->arg]);
                        _op->opcache[1] = (object*)pos;
                        *ctx->stackptr++ = ob_sub_offt(obj, pos);
                    }
                } else {
                    //perform usual subscr
                    if(o->type->subscript_get){
                        *ctx->stackptr++ = o->type->subscript_get(o, ctx->co_static->statics[_op->arg]);
                    } else {
                        *ctx->stackptr++ = 0;
                    }
                }
            }break;
            case _subscr_set:{
                object* o = *--ctx->stackptr;
                object* subscribant = *--ctx->stackptr;
                object*val = *--ctx->stackptr;
                if(o)
                    o->type->subscript_set(o, subscribant, val);
                if(_op->arg == -1)
                    *ctx->stackptr++ = o;
            }break;
            case assign_many : {
                
            }break;
            case push_null:
                break;
            case op_lt:{
                object* right = *--ctx->stackptr;
                object* left = *--ctx->stackptr;
                char result = left->type->lt(left, right);
                *ctx->stackptr++ = boolfromlexem(result);
            }break;
            case op_eq:{
                object* right = *--ctx->stackptr;
                object* left = *--ctx->stackptr;
                if(!left || !left->type->eq){
                    *ctx->stackptr++ = 0;
                    break;
                }
                char result = left->type->eq(left, right);
                *ctx->stackptr++ = boolfromlexem(result);
            } break;
            case op_contains:{
                object*right = *--ctx->stackptr;
                object*left = *--ctx->stackptr;
                char result = right->type->contains(right, left);
                *ctx->stackptr++ = boolfromlexem(result);
            } break;
            case doasync:{
                struct _crt * newcoro = start_coro(t, ctx->co_static);
                context * async_ctx = newcoro->sttop;
                for(int i = 0; i<ctx->co_static->namecount; ++i){
                    async_ctx->vars[i] = ctx->vars[i];
                    if(ctx->vars[i])
                        INCREF(async_ctx->vars[i]);
                }
                async_ctx->inst_pointer = ctx->inst_pointer;
                async_ctx->stop_ptr = ctx->inst_pointer+_op->arg;
                ctx->inst_pointer+=_op->arg;
            }break;
            case unpack_tuple:{
                object*sttop = *--ctx->stackptr;
                if(strcmp(sttop->type->name, "bundle")!=0){
                    fprintf(stderr, "cannot unpack type %s: bundle required\n", sttop->type->name);
                    break;
                }
                bundle* b = (bundle*)sttop;
                if(b->count < _op->arg){
                    fprintf(stderr, "too many items to unpack\n");
                }
                for(int i = _op->arg; i> 0; --i){
                    *ctx->stackptr++ = b->items[i - 1];
                }
                if(b->refcnt == 0)
                    ob_dealloc((object*)b);
            } break;
            case import:{
               
                //get the name
                char*modname = ((dulstring*)*--ctx->stackptr)->content;
                char mnamebuf [100];
                //first search in this dir, then in DLIB
                if(access(modname, F_OK)==-1){
                    sprintf(mnamebuf, "DLIB/%s", modname);
                    modname = mnamebuf;
                }
                if(strstr(modname, ".dul")){
                    funcobject * f = file_to_fo(modname);
                    context * c = init_context(f, ctx->coroutine);
                    c->non_destroy = 1;
                    
                } else {
                   
                    *ctx->stackptr++ = import_module(modname);
                }
                /*object* mod = getmodule(modname);
                if(!mod){
                    fprintf(stderr, "module not found %s", modname);
                    break;
                }
                *ctx->stackptr ++ = mod;*/
                
            } break;
            case op_inpl_add:{
                object* right = *--ctx->stackptr;
                object* left = *--ctx->stackptr;
                if(left && left->type->inpadd){
                    object* res = left->type->inpadd(left, right);
                    if(res != left){
                        INCREF(res);
                        DECREF(ctx->vars[_op->arg]);
                        ctx->vars[_op->arg] = res;
                    }
                } else {
                    // error !
                }
            }break;
            case pack_module:{
                ctx->this_ptr = new_ob();
                for(int i = 0; i<ctx->co_static->namecount; ++i){
                   
                        //otherwise is private
                        ob_subscr_set(ctx->this_ptr, strfromchar(ctx->co_static->varnames[i]), ctx->vars[i]);
                    
                }
            }break;
            case op_geq:{
                object * right = *--ctx->stackptr;
                object * left = *ctx->stackptr;
                if(left && left->type->gequal){
                    *ctx->stackptr = boolfromlexem(left->type->gequal(left, right));
                } else {
                    *ctx->stackptr = 0;
                }
            }break;
            case op_leq:{
                object * right = *--ctx->stackptr;
                object * left = *ctx->stackptr;
                if(left && left->type->lequal){
                    *ctx->stackptr = boolfromlexem(left->type->lequal(left, right));
                } else {
                    *ctx->stackptr = 0;
                }
            }break;
            case op_gt:{
                object * right = *--ctx->stackptr;
                object * left = *ctx->stackptr;
                if(left && left->type->gt){
                    *ctx->stackptr = boolfromlexem(left->type->gt(left, right));
                } else {
                    *ctx->stackptr = 0;
                }
            }break;
            default:
                break;
        }
        if(ctx->inst_pointer >= ctx->stop_ptr){
            if(ctx->return_to){
                *(ctx->return_to->stackptr)++ = ctx->this_ptr;
                //atomic_store(&coro->t->coro_lock, 0);
            }
            //decref_thread_workload(t);
            ctx->coroutine->sttop = ctx->return_to;
            goto get_coro;
        } else {
            if(t->workload == 1 && ctx == ctx->coroutine->sttop){
                goto ctx_exec;
            }
            goto ctx_exec;
        }
    goto get_coro;
}
