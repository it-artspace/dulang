//
//  funcobject.h
//  dulang
//
//  Created by Дмитрий Маслюков on 12/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#ifndef funcobject_h
#define funcobject_h
#include "typeInterface.h"
/*
 its like a template to generate context, containing most important base info
 function is basic object in dulang: all modules are functions, all files are modules
*/

struct ctx;
typedef struct fobj {
    ObHead
    char**varnames;
    //actually args passed are also used as varnames - they are visible only within the function
    //and when func is invoked first argcount names are moved
    object**statics;
    //statics are atomic types or funcobjects that are pre-evaluated
    // are evaluated on opcode funcdef
    int namecount;
    int argcount;
    int statcount;
    int statcap;
    int stack_cap;
    int opcount;
    int name_cap;
    int op_cap;
    struct fobj* outer_scope;
    struct ctx*  outer_context;
    struct op{
        //first is declared as int - why not, it anyway will have alignof 8
        int op_code;
        int arg;
        int lineno;
        int linepos;
    } *byteops;
    
} funcobject;

char* dumpfunc(object*);
void fsetup(funcobject*);
void include_standard(funcobject*); //aka module-setup
object* invoke_lambda(funcobject*, object*_this);
extern const char *opcode_repres_ [];
extern const struct obtype FUNCTYPE;
#endif /* funcobject_h */
