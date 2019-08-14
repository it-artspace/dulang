//
//  bycgenerator.h
//  NIolang
//
//  Created by Дмитрий Маслюков on 12/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#ifndef bycgenerator_h
#define bycgenerator_h

#include "parser.h"
#include "ast.h"
#include "../API/funcobject.h"

typedef struct _b_w{
    char**funcnames;
    //to simply save them
    object**statics;
    int name_count;
    int name_cap;
    int byc_c;
    int byc_cap;
    int stat_c;
    int stat_cap;
    struct {
        int opcode;
        int arg;
    } *ops;
    struct _b_w*parent;
} byc_writer;
funcobject* loadfunc(byc_writer*);
funcobject* loadmodule(const char*fname);
void extract_names(astnode*root, byc_writer*wr);
byc_writer* init_bytecode_writer(void);
void add_name_to_writer(byc_writer*, char*);
void write_op(byc_writer*, int, int);
enum op_codes {
    load_outer,
    load_static,
    load_name,
    store_name,
    //store_outer,
    _subscr_get,
    _subscr_set,
    jump,
    jne,
    init_iter,
    iter_next,
    stack_revert,
    mktuple,
    ioreturn
};




int nametable_lookup(byc_writer*, char*name);
void write_assign(byc_writer*, astnode*assign_node);
void write_if(byc_writer*, astnode*ifnode);
void write_node(byc_writer*, astnode*);
void print_op(byc_writer*, int);
#endif /* bycgenerator_h */
