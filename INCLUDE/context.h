//
//  context.h
//  dulang
//
//  Created by Дмитрий Маслюков on 13/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#ifndef context_h
#define context_h

#include "../api.h"
#define use_writer 0
struct thread;
struct w;
struct _crt;
typedef struct ctx{
    object** vars;
    const funcobject* co_static;
    int current_op;
    int stop_op;
    int is_waiting;
    int is_weakref;
    object** stackptr;
    object** rstptr;
    object** stack_to_revert;
    object* this_ptr;
    struct ctx* return_to;
    struct w*writer;
    struct _crt* coroutine;
} context;

context* init_context(const funcobject*, struct _crt*coro);
void     link_async(context*);
//here we think that start and stop op are managed correctly
void link_context(context*);
int exec_context(context*);
void eval_std (context*);
void destroy_context(context*);
#endif /* context_h */
