//
//  context.c
//  dulang
//
//  Created by Дмитрий Маслюков on 13/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../INCLUDE/context.h"
#include "../INCLUDE/dulthread.h"
#include "../api.h"
#include "../debuginfo.h"
#include "../buildscript.h"
#include <ctype.h>
#include <unistd.h>


int exec_context(context*ctx){
    struct op * _op = ctx->inst_pointer++;
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
        case store_name:
            if(ctx->vars[_op->arg])
                DECREF(ctx->vars[_op->arg]);
            ctx->vars[_op->arg] = *--ctx->stackptr;
            INCREF(ctx->vars[_op->arg]);
            
#if print_opcode_run
            if(ctx->vars[_op->arg] && ctx->vars[_op->arg]->type->dump){
                char* dumpvar = ctx->vars[_op->arg]->type->dump(ctx->vars[_op->arg]);
                printf("%*s = %s\n", 10, ctx->co_static->varnames[ _op->arg ], dumpvar );
                free(dumpvar);
            }
            
#endif
            break;
        case load_name:
            *ctx->stackptr++ = ctx->vars[_op->arg];
            break;
        case load_static:
            if(!ctx->cur_expr)
                *ctx->stackptr++ = ctx->co_static->statics[_op->arg];
            else
                *ctx->stackptr++ = ctx->cur_expr->inlined_in->statics[_op->arg];
            break;
        case _write:
            do{
                object* sttop = *--ctx->stackptr;
                if(!sttop){
                    printf("null\n");
                } else {
                    
#if use_writer
                    binarg a;
                    a.aptr = ctx->stackptr -= _op->arg - 1;
                    a.a_passed = _op->arg;
                    push((object*)ctx->writer, a);
#else
                    printf("%s\n", dump);
#endif
                    
                }
                

            }while(0);
            break;
        case jump_if_not_true:{
            object* b = *--ctx->stackptr;
            if(!b){
                ctx->inst_pointer += _op->arg;
                break;
            }
            if(b->type == &BOOLTYPE)
                if(!((dulbool*)b)->val)
                    ctx->inst_pointer += _op->arg;

            }break;
        case jump:
            ctx->inst_pointer+= _op->arg;
            break;
        case funcdef:
            do{ funcobject* generic = (funcobject*)ctx->co_static->statics[_op->arg];
                
                    funcobject* newobj = (funcobject*)dulalloc(sizeof(funcobject));
                    memcpy(newobj, generic, sizeof(funcobject));
                    newobj->outer_context = ctx;
                    *ctx->stackptr++ = (object*)newobj;
                
                
            }while(0);
            break;
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
                *ctx->stackptr++ = f->func_pointer(Args ,ctx->coroutine);
                //DECREF(args);
                
            }
           
            if(strcmp(sttop->type->name, "object")==0){
                if(_op->arg == 0){
                    //is invoked as constructor
                    object * o = new_ob();
                    single_ob * self = (single_ob*)sttop;
                    for(int i = 0; i< self->cap; ++i){
                        if(self->content[i].name){
                            ob_subscr_set(o, self->content[i].name, self->content[i].member);
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
                
                if(this_pos != -1)
                    c->vars[this_pos] = (object*)sttop;
                c->this_ptr      = sttop;
            }
        } break;
        case dulreturn:
            if(ctx->return_to){
                object* return_result = *--ctx->stackptr;
                 *(ctx->return_to->stackptr)++ = return_result;
            }
            
            return 1;
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
                    object* method_ob = self->type->subscript_get(self, s);
                    //methodob typecheck
                    if(!method_ob){
                        break;
                    }
                    if(strcmp(method_ob->type->name, "builtin")==0){
#warning TODO: this pass
                        binarg a;
                        a.a_passed = _op->arg;
                        a.aptr = ctx->stackptr -= a.a_passed;
                        *ctx->stackptr++ = ((builtin_func*)method_ob)->func_pointer(a, ctx->coroutine);
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
                bin_method* bin_method_ = (bin_method*)ob_subscr_get(self->type->get_methods(), m_name_casted);
                *ctx->stackptr++ = bin_method_->func_pointer(self, a);
            }
            
            
            
        }break;
        case _subscr_get:{
            object* o = *--ctx->stackptr;
            object* subscribant = *--ctx->stackptr;
            *ctx->stackptr++ = o->type->subscript_get(o, subscribant);
        }break;
        case _subscr_set:{
            object* o = *--ctx->stackptr;
            object* subscribant = *--ctx->stackptr;
            object*val = *--ctx->stackptr;
            if(o)
                o->type->subscript_set(o, subscribant, val);
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
            struct _crt * newcoro = start_coro(current_thread, ctx->co_static);
            context * async_ctx = newcoro->sttop;
            for(int i = 0; i<ctx->co_static->namecount; ++i){
                async_ctx->vars[i] = ctx->vars[i];
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
        if(ctx->cur_expr){
            ctx->inst_pointer = ctx->cur_expr->return_to;
            ctx->stop_ptr = ctx->co_static->byteops + ctx->co_static->opcount;
            ctx->cur_expr = 0;
            return 0;
        }
        if(ctx->return_to)
            *(ctx->return_to->stackptr)++ = ctx->this_ptr;
        return 1;
    } else {
        return 0;
    }
}

typedef struct {
    //inherited from channel
    ObHead
    object ** first;
    object ** last;
    int capacity;
    object * receive_callback;
    FILE* send_to;
} dulIOchannel;

METHOD_DECL(flush_writer){
    dulIOchannel* self_ = (dulIOchannel*)self;
    if(self_->send_to == 0)
        self_->send_to = stdout;
    for(object** iter = self_->first; iter != self_->last; ++iter){
        if(*iter){
            if((*iter)->type->dump){
                char* d = (*iter)->type->dump((*iter));
                fprintf(self_->send_to, "%s", d);
                free(d);
            } else {
                fprintf(self_->send_to, "%s at %lX", (*iter)->type->name, (long)(*iter));
            }
        } else {
            fprintf(self_->send_to, "null");
        }
        fputc(' ', self_->send_to);
    }
    fputc('\n', self_->send_to);
    self_->last = self_->first;
    fflush(self_->send_to);
    return 0;
}

bin_method flush = {
    &BINTYPE,
    1, //isnt to be garbage-collected
    &flush_writer
};

object* new_IOchannel(){
    dulIOchannel * c = malloc(sizeof(dulIOchannel));
    c->refcnt = 1;
    c->type = &CHANTYPE;
    c->capacity = 15;
    c->first = malloc(15*sizeof(object*));
    c->last = c->first;
    c->receive_callback = (object*)&flush;
    c->send_to = output;
    return (object*)c;
}


context* init_context(const funcobject*co_static, struct _crt*coro){
    context* ctx = (context*)dulalloc(sizeof(context));
#if use_writer
    ctx->writer = (dulchannel*)new_IOchannel();
#endif
    ctx->co_static = co_static;
    ctx->stackptr = (object**)dulalloc(1000*sizeof(object*));
    ctx->rstptr = ctx->stackptr;
    ctx->inst_pointer  = co_static->byteops;
    if(coro)
        ctx->return_to = coro->sttop;
    else
        ctx->return_to = 0;
    ctx->cur_expr = 0;
    ctx->coroutine = coro;
    ctx->stop_ptr = co_static->opcount + co_static->byteops;
    ctx->this_ptr = NULL;
    ctx->vars = (object**)dulalloc(co_static->namecount*sizeof(object*));
    for(int i = 0; i<co_static->namecount; ++i)
        ctx->vars[i] = 0;
    eval_std(ctx);
    if(coro)
        coro->sttop = ctx;
    return ctx;
}


void destroy_context(context*ctx){
    for(int i = 0; i<ctx->co_static->namecount; ++i){
        //DECREF(ctx->vars[i])
    }
    //
    
    dulfree(ctx->rstptr);
    //vars will be freed in another place
    free(ctx);
}


void link_async(context*ctx){
    struct _crt* new_coroutine = (struct _crt*)dulalloc(sizeof(struct _crt));
    struct _crt* prev = current_thread->current;
    struct _crt* next = current_thread->current->next;
    new_coroutine->next = next;
    next->prev = new_coroutine;
    new_coroutine->prev = prev;
    prev->next = new_coroutine;
    current_thread->workload++;
    new_coroutine->state = coro_running;
    new_coroutine->sttop = ctx;
}
