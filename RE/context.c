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


int exec_context(context*ctx){
    struct op * _op = ctx->co_static->byteops+ ctx->current_op++;

#if print_opcode_run
    printf("executing %2d opcode at %10lX: %*s : %d\n", ctx->current_op-1, (unsigned long)ctx, 20, opcode_repres_[_op->op_code], _op->arg);
#endif
    switch (_op->op_code) {
        case store_name:
            if(ctx->vars[_op->arg])
                DECREF(ctx->vars[_op->arg]);
            ctx->vars[_op->arg] = *--ctx->stackptr;
            ctx->vars[_op->arg]->refcnt++;
            
#if print_opcode_run
            char* dumpvar = ctx->vars[_op->arg]->type->dump(ctx->vars[_op->arg]);
            printf("%*s = %s\n", 10, ctx->co_static->varnames[ _op->arg ], dumpvar );
            free(dumpvar);
#endif
            break;
        case load_name:
            *ctx->stackptr++ = ctx->vars[_op->arg];
            break;
        case load_static:
            *ctx->stackptr++ = ctx->co_static->statics[_op->arg];
            break;
        case write:
            do{
                object* sttop = *--ctx->stackptr;
                if(!sttop){
                    printf("null\n");
                } else {
                    char* dump = sttop->type->dump(sttop);
#if use_writer
                    
                    fprintf(output, "%s\n", dump);
#else
                    printf("%s\n", dump);
#endif
                    free(dump);
                }
                

            }while(0);
            break;
        case jump_if_not_true:
            do{
                object* b = *--ctx->stackptr;
                if(strcmp(b->type->name, "boolean")!=0 )
                    printf("cannot check if expr is true\n");
                if(!((dulbool*)b)->val)
                    ctx->current_op += _op->arg;
            }while(0);
            break;
        case jump:
            ctx->current_op+= _op->arg;
            break;
        case funcdef:
            do{ funcobject* generic = (funcobject*)ctx->co_static->statics[_op->arg];
                
                    funcobject* newobj = (funcobject*)malloc(sizeof(funcobject));
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
            if(strcmp(sttop->type->name, "functional object") == 0){
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
            if(strcmp(sttop->type->name, "builtin") == 0){
                
                builtin_func* f = (builtin_func*)sttop;
                binarg Args = {ctx->stackptr -= _op->arg, _op->arg};
                *ctx->stackptr++ = f->func_pointer(Args ,ctx->coroutine);
                //DECREF(args);
                
            }
            if(strcmp(sttop->type->name, "object")==0){
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
                ctx->current_op += _op->arg;
                
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
            if(self->type->method_invoke == 0){
                //try to get as member
                if(strcmp(method_name->type->name, "string")==0){
                    dulstring* s = (dulstring*)method_name;
                    object* method_ob = self->type->strsubscr_get(self, s->content);
                    //methodob typecheck
                    if(strcmp(method_ob->type->name, "builtin")==0){
#warning TODO: this pass
                        binarg a;
                        a.a_passed = _op->arg;
                        a.aptr = ctx->stackptr -= a.a_passed;
                        *ctx->stackptr++ = ((builtin_func*)method_ob)->func_pointer(a, ctx->coroutine);
                        break;
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
                
            }
            
            
            
        }break;
        case _subscr_get:{
            object* o = *--ctx->stackptr;
            object* subscribant = *--ctx->stackptr;
            if(strcmp(subscribant->type->name, "number")==0){
                if(o->type->subscript_get){
                    *ctx->stackptr++ = o->type->subscript_get(o, ((dulnumber*)subscribant)->val);
                }
            }
            if(strcmp(subscribant->type->name, "string")==0){
                if(o->type->strsubscr_get){
                    dulstring* str = (dulstring*)subscribant;
                    *ctx->stackptr++ = o->type->strsubscr_get(o, str->content);
                }
            }
            
            
           
        }break;
        case _subscr_set:{
            object* o = *--ctx->stackptr;
            object* subscribant = *--ctx->stackptr;
            object*val = *--ctx->stackptr;
            if(strcmp(subscribant->type->name, "number")==0){
                if(o->type->subscript_set){
                    o->type->subscript_set(o, ((dulnumber*)subscribant)->val, val);
                }
            }
            if(strcmp(subscribant->type->name, "string")==0){
                if(o->type->strsubscr_set){
                    dulstring* str = (dulstring*)subscribant;
                    o->type->strsubscr_set(o, str->content, val);
                }
            }
        }break;
        case assign_many : {
            
        }break;
        case push_null:
            *ctx->stackptr = 0;
            ctx->stackptr++;
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
            context* async_ctx = init_context(ctx->co_static, 0);
            for(int i = 0; i<ctx->co_static->namecount; ++i){
                async_ctx->vars[i] = ctx->vars[i];
                INCREF(async_ctx->vars[i]);
            }
            async_ctx->current_op = ctx->current_op;
            async_ctx->stop_op = ctx->current_op+_op->arg;
            link_async(async_ctx);
            ctx->current_op+=_op->arg;
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
            struct op *prev_op = ctx->co_static->byteops + ctx->current_op - 2;
            //get the name
            char*modname = ctx->co_static->varnames[prev_op->arg];
            object* mod = getmodule(modname);
            if(!mod){
                fprintf(stderr, "module not found %s", modname);
                break;
            }
            ctx->vars[prev_op->arg] = mod;
            
        } break;
        default:
            break;
    }
if(ctx->current_op >= ctx->stop_op){
        if(ctx->return_to)
            *(ctx->return_to->stackptr)++ = ctx->this_ptr;
        return 1;
    } else {
        return 0;
    }
}


void flush_writer(writer*w){
    fprintf(output, "%*s", (int)(w->pos - w->buffer), w->buffer);
    w->pos = w->buffer;
}


context* init_context(const funcobject*co_static, struct _crt*coro){
    context* ctx = (context*)malloc(sizeof(context));
#if use_writer
    ctx->writer = (writer*)malloc(sizeof(writer));
    ctx->writer->pos = ctx->writer->buffer;
    ctx->writer->flush = &flush_writer;
#endif
    ctx->co_static = co_static;
    ctx->stackptr = (object**)malloc(1000*sizeof(object*));
    ctx->rstptr = ctx->stackptr;
    ctx->current_op = 0;
    ctx->is_weakref = 0;
    ctx->is_waiting = 0;
    if(coro)
        ctx->return_to = coro->sttop;
    else
        ctx->return_to = 0;
    ctx->coroutine = coro;
    ctx->stop_op = co_static->opcount;
    ctx->this_ptr = NULL;
    ctx->vars = (object**)malloc(co_static->namecount*sizeof(object*));
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
    
    free(ctx->rstptr);
    //vars will be freed in another place
    free(ctx);
}


void link_async(context*ctx){
    struct _crt* new_coroutine = (struct _crt*)malloc(sizeof(struct _crt));
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
