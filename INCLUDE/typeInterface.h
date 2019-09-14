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
    bin_func_id,
    bin_m_id,
    method_id
};
struct _crt;
typedef struct {object **aptr; int a_passed;} binarg;


struct obtype{
    char * name;
    char* (*dump)(object*);
    object*     (*allocate)     (void);
    void        (*dealloc)      (object*self);
    object*     (*plus_op)      (object*,  object*);
    object*     (*minus_op)     (object*,  object*);
    object*     (*mult_op)      (object*,  object*);
    object*     (*div_op)       (object*,  object*);
    object*     (*inpadd)       (object*,  object*);
    object*     (*inpsub)       (object*,  object*);
    object*     (*inpmult)      (object*,  object*);
    object*     (*inpdiv)       (object*,  object*);
    char        (*lt)           (object*,  object*);
    char        (*gt)           (object*,  object*);
    char        (*eq)           (object*,  object*);
    char        (*lequal)       (object*,  object*);
    char        (*gequal)       (object*,  object*);
    object*     (*invoke)       (object*, object* Args);
    //a in b -> contains(b, a)
    char        (*contains)     (object*,  object*);
    object*     (*init_iter)    (object*);
    //returns iter, null on end
    object*     (*iter_next)    (object*);
    object*     (*subscript_get)(object*, object*);
    void        (*subscript_set)(object*, object*, object*);
    object*     (*tostr)        (object*);
    object*     (*copy)         (object*);
    object*     (*unpack_iter)  (object*);
    int type_id; //for fast type-checks
    object*     (*get_methods)  (void);
    
    //returs pointer that needs to be freed after use
	
    //firstly dump was considered as a builtin function, but it is very type specified
    
};






#endif /* typeInterface_h */
