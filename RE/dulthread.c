//
//  dulthread.c
//  dulang
//
//  Created by Дмитрий Маслюков on 13/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../INCLUDE/dulthread.h"
#include <math.h>
struct thread work_pool[numthreads];

struct thread*less_loaded = work_pool;
struct thread*current_thread = work_pool;


void destroy_coro(struct _crt*c){
    //free(c);
}

int exec_coro(struct _crt*coroutine){
    switch(coroutine->state){
        case coro_running:{
            context* c = coroutine->sttop;
            if(exec_context(c)){
                //context is finished
#if use_writer
                c->writer->flush(c->writer);
#endif
                context* next = c->return_to;
                destroy_context(c);
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
    struct _crt * coro = (struct _crt *) malloc( sizeof( struct _crt));
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
                return --current_thread->workload;
            }break;
        }
    }
    current_thread->current = coro->next;
    return current_thread->workload;
}

void writer_append(writer* w, const char*src){
    int len = strlen(src);
    int strpos = 0;
    while(strpos < len){
        strncpy(w->pos, src + strpos, 1000 - (w->pos - w->buffer));
        strpos += 1000 - (w->pos - w->buffer);
        w->flush(w);
        w->pos = w->buffer;
    }
}
