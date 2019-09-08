//
//  funcobject.c
//  dulang
//
//  Created by Дмитрий Маслюков on 18/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../api.h"
#include "../debuginfo.h"
#include <stdlib.h>

const char *opcode_repres_ [] =  {
    "load_outer",
    "load_static",
    "load_name",
    "store_name",
    "_subscr_get",
    "_subscr_set",
    "jump",
    "jump_if_not_true",
    "init_iter",
    "iter_next",
    "mktuple",
    "dulreturn",
    "check_iter", //argument is jump if ended
    "invoke",
    "unpack_iter",
    "doasync",
    "write",
    "invoke_method",
    "push_null",
    "funcdef",
    "op_plus",
    "op_minus",
    "op_mult",
    "op_div",
    "op_inpl_add",
    "op_inpl_sub",
    "op_inpl_mult",
    "op_inpl_div",
    "op_lt",
    "op_gt",
    "op_eq",
    "op_leq",
    "op_geq",
    "assign_many",
    "implsubscr",
    "import",
    "contains",
    "unpack",
    "expr_stop",
    "pack_mod",
    "push_object"
};

void destroy_func(object*f){
    //TODO!
}

const struct obtype FUNCTYPE = {
    "functional object",
    &dumpfunc, //dump
    0, //alloc
    &destroy_func, //dealloc
    0, //+
    0, //-
    0, // *
    0, // /
    0, // +=
    0, // -=
    0, // *=
    0, // /=
    0, // <
    0, // >
    0, // ==
    0, // <=
    0, // >=
    0, // f()
    0, // a in b
    0, //init_iter (collection initializes iter)
    0, //next_iter
    0, // [0]
    0, // [0] =
    0, // tostr
    0, //copy
    0,  //unpack,
    func_id //typeid
};

void fsetup(funcobject*f){
    f->type = &FUNCTYPE;
}

char* dumpfunc(object*fobj){
#if print_bytecode
    char w_space_str[] = "                    ";
    funcobject*f = (funcobject*)fobj;
    char*global_dump = (char*)malloc(32768);
    int bias = 0;
    bias = sprintf(global_dump, "\n\tfunctional object:\n\tnames:\n");
    for(int i = 0; i<f->namecount; ++i){
        bias+= sprintf(global_dump+bias, "\t\t%s\n", f->varnames[i]);
    }
    bias+=sprintf(global_dump+bias, "\tstatics:\n");
    for(int i = 0; i<f->statcount; ++i){
        if(f->statics[i]->type->dump){
            char*local_dump = f->statics[i]->type->dump(f->statics[i]);
            bias+=sprintf(global_dump+bias, "\t\t%s\n", local_dump);
            free(local_dump);
        }
       
    }
    bias+=sprintf(global_dump+bias, "\topcodes:\n");
    for(int i = 0; i<f->opcount; ++i){
        bias+=sprintf(global_dump+bias, "\t\t%.2d %s%.*s :  %d\n",
            i+1,
            opcode_repres_[f->byteops[i].op_code],
            20 - (int)strlen(opcode_repres_[f->byteops[i].op_code]),
            w_space_str,
            f->byteops[i].arg);
    }
#else
    char* global_dump = (char*)dulalloc(100);
    sprintf(global_dump, "function at %lX", (unsigned long)fobj);
#endif
    return global_dump;
}

