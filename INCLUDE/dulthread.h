//
//  dulthread.h
//  dulang
//
//  Created by Дмитрий Маслюков on 13/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#ifndef dulthread_h
#define dulthread_h

#include "../api.h"
//#include "../RE/RE_special.h"
extern FILE* output;


enum coro_states {
    coro_finished,
    coro_waiting,
    coro_running
};

struct thread{
    int workload;
    int needs_to_stop;
    int has_stopped;
    struct _crt{
        struct _crt*next;
        struct _crt*prev;
        context*sttop;
        enum coro_states state;
    } * current;
};
#define numthreads 1
#define flush_stdout
extern struct thread work_pool[numthreads];
extern struct thread*less_loaded;
extern volatile struct thread*current_thread;
int exec_thread(void);
//returns 0 on finish

struct _crt * start_coro( struct thread* thr, funcobject* func );
void destroy_coro(struct _crt*);
extern const builtin_func *bins[];
extern const int bin_count;


#endif /* dulthread_h */
