//
//  context.c
//  dulang
//
//  Created by Дмитрий Маслюков on 13/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../INCLUDE/context.h"
#include "../buildscript.h"
#include "../INCLUDE/dulthread.h"
#include "../api.h"
#include "../debuginfo.h"
#include "../buildscript.h"
#include <ctype.h>
#include <unistd.h>


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


context* init_context(funcobject*co_static, struct _crt*coro){
    static dulchannel * writer = 0;
    context* ctx;
    if ( 0 && &co_static->reused_ctx[0] < co_static->r_ctx_stackpos ){
        ctx = *--co_static->r_ctx_stackpos;
    } else {
        ctx = (context*)dulalloc(sizeof(context));
        ctx->co_static = co_static;
        ctx->stackptr = (object**)dulalloc(2000*sizeof(object*));
        ctx->vars = (object**)dulalloc(co_static->namecount*sizeof(object*));
    }
    
#if use_writer
    if( ! writer )
        writer = (dulchannel*)new_IOchannel();
    ctx->writer = writer;
#endif
    
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
    for(int i = 0; i<co_static->namecount; ++i)
        ctx->vars[i] = 0;
    eval_std(ctx);
    if(coro){
        coro->sttop = ctx;
        ctx->outer_scope = coro->sttop;
    }
    return ctx;
}


void destroy_context(context*ctx){
    if(!ctx->non_destroy){
        for(int i = 0; i<ctx->co_static->namecount; ++i){
            DECREF(ctx->vars[i])
        }
        for(object** stcleaner = ctx->rstptr; stcleaner != ctx->stackptr; ++stcleaner){
            DECREF(*stcleaner);
        }
        funcobject * f = (funcobject*)ctx->co_static;
        if( f->reused_ctx + 10 > f->r_ctx_stackpos ){
            *f->r_ctx_stackpos++ = ctx;
        } else {
            free(ctx->rstptr);
            free(ctx->vars);
            free(ctx);
        }
        
    }
    
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
