//
//  typeInterface.h
//  dulang
//
//  Created by Дмитрий Маслюков on 02/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#ifndef typeInterface_h
#define typeInterface_h
#include "object.h"

#include <stdlib.h>
#include <strings.h>
#include <time.h>
#include <stdio.h>
static FILE* trshootlog;

struct ctx;
enum type_ids {
    number_id,
    string_id,
    tuple_id,
    array_id,
    object_id,
    func_id,
    range_id,
    iter_id,
    bin_func
};
struct _crt;
typedef struct {object **aptr; int a_passed;} binarg;

typedef object* (*bin_method_func)(object*self, binarg Args, struct _crt * coro);

struct obtype{
     char  *name;
    char* (*dump)(object*);
    object*     (*allocate)     (void);
    void        (*dealloc)      (object*self);
    object*     (*plus_op)      ( object*,  object*);
    object*     (*minus_op)     ( object*,  object*);
    object*     (*mult_op)      ( object*,  object*);
    object*     (*div_op)       ( object*,  object*);
    void        (*inpadd)       (object**,  object*);
    void        (*inpsub)       (object*,  object*);
    void        (*inpmult)      (object*,  object*);
    void        (*inpdiv)       (object*,  object*);
    char        (*lt)           ( object*,  object*);
    char        (*gt)           ( object*,  object*);
    char        (*eq)           ( object*,  object*);
    char        (*lequal)       ( object*,  object*);
    char        (*gequal)       ( object*,  object*);
    object*     (*invoke)       ( object*, object* Args);
    //a in b -> contains(b, a)
    char        (*contains)     ( object*,  object*);
    object*     (*init_iter)    ( object*);
    //returns iter, null on end
    object*     (*iter_next)    (object*);
    object*     (*subscript_get)( object*, int);
    void        (*subscript_set)(object*, int, object*);
    object*     (*strsubscr_get)( object*,  char*);
    void        (*strsubscr_set)(object*,  char*, object*);
    object*     (*tostr)        ( object*);
    object*     (*copy)         ( object*);
    object*     (*unpack_iter)  ( object*);
    object*     (*method_invoke)(object*,  char*, object*);
    int type_id; //for fast type-checks
    int method_num;
    struct _m{
        bin_method_func fptr;
        char name [20];
    } * methods;
    
    //returs pointer that needs to be freed after use
	
    //firstly dump was considered as a builtin function, but it is very type specified
    
};

void assert_type(object*self,  char*type_name,  char*op);




#endif /* typeInterface_h */
