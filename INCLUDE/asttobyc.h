//
//  asttobyc.h
//  dullang
//
//  Created by Дмитрий Маслюков on 22/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#ifndef asttobyc_h
#define asttobyc_h

#include "../api.h"

funcobject* load_file(const char* fname);
void extract_names(funcobject*, astnode*);
struct op * write_op(funcobject*, int, int);
struct op * load_func(funcobject* writer, astnode*);
struct op * write_assign(funcobject* writer, astnode*);
struct op *  write_node(funcobject* writer, astnode*);
struct op * write_if(funcobject*, astnode*);
struct op * write_for(funcobject*, astnode*);
funcobject* init_func(const funcobject*);
void write_expression(exprobject*, funcobject*, astnode*);

enum opcodes {
    load_outer,
    load_static,
    load_name,
    store_name,
    _subscr_get,
    _subscr_set,
    jump,
    jump_if_not_true,
    init_iter,
    iter_next,
    mktuple,
    dulreturn,
    check_iter, //argument is jump if ended
    invoke,
    unpack_iter,
    doasync,
    _write,
    invoke_method,
    push_null,
    funcdef,
    op_plus,
    op_minus,
    op_mult,
    op_div,
    op_inpl_add,
    op_inpl_sub,
    op_inpl_mult,
    op_inpl_div,
    op_lt,
    op_gt,
    op_eq,
    op_leq,
    op_geq,
    assign_many,
    /*
     How it works: it leaves the right part of expression on stack, takes an argument of needed subscript and does it implicitly within the execution loop
     */
    inplace_subscr_op,
    /*
     the only special use-case for this op is the situation when subscr has refcnt > 1 and needs to be copied
     therefore, we get_subscr and if refcnt is more than 1, we do implicitly from bytecode set_subscr with copying
     Argument is 0 to 3 - number of subscript operator: + - * /
     */
    import,
    op_contains,
    unpack_tuple,//arg is the number of elems to unpack, is unpacked reversly
    ret_from_expr,
    pack_module,
    push_object,
    store_iter,
    load_stat_subscr,
    op_nequal
};

/*
 const char *opcode_repres_ []= {
 "load_outer",
 "load_static",
 "load_name",
 "store_name",
 "store_outer",
 "_subscr_get",
 "_subscr_set",
 "jump",
 "jne",
 "init_iter",
 "iter_next",
 "stack_revert",
 "mktuple",
 "ioreturn"
 };*/
#endif /* asttobyc_h */
