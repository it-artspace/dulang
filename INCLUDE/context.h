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
#include "channel.h"
#define use_writer 1
struct thread;
struct _crt;
typedef struct ctx{
    object** vars;
    const funcobject* co_static;
    struct op* inst_pointer;
    struct op* stop_ptr;
    object** stackptr;
    object** rstptr;
    object** stack_to_revert;
    object* this_ptr;
    exprobject * cur_expr;
    struct ctx* return_to;
    struct ctx* outer_scope;
    dulchannel * writer;
    struct _crt* coroutine;
    int non_destroy;
} context;

context* init_context(funcobject*, struct _crt*coro) __attribute__((weak_import));
void     link_async(context*);
//here we think that start and stop op are managed correctly
void link_context(context*);
void eval_std (context*);
void destroy_context(context*);
#endif /* context_h */
