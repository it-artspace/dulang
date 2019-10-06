//
//  builtin.h
//  dulang
//
//  Created by Дмитрий Маслюков on 18/07/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#ifndef builtin_h
#define builtin_h

#include "typeInterface.h"
//actually needs to check the arguments explicitly

struct _crt;

typedef object* (*binfptr)      (binarg Args);
typedef object* (*method_ptr)   (object* self, binarg Args);
#define METHOD_DECL(name) object* name(object*self, binarg Args, context*ctx)
#define BIN_DECL(name)  object* name(binarg Args, context*ctx)

typedef struct {
    ObHead
    const char * name;
    binfptr func_pointer;
} builtin_func;

typedef struct {
    ObHead
    method_ptr func_pointer;
} bin_method;

object* __bin_obdump    (binarg Args);
object* __bin_range     (binarg Args);
object* __bin_typeof    (binarg Args);
object* __bin_object    (binarg Args);
object* __bin_str       (binarg Args);
object* __bin_array     (binarg Args);
object* __bin_time      (binarg Args);
extern const struct obtype BINTYPE;
extern const struct obtype BINMTYPE;
#endif /* builtin_h */
