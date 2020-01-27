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

typedef object* (*binfptr)      (binarg Args, struct ctx*);
typedef object* (*method_ptr)   (object* self, binarg Args, struct ctx *);
#define METHOD_DECL(name) object* name(object*self, binarg Args, struct ctx*ctx)
#define BIN_DECL(name)  object* Dul##name(binarg Args, struct ctx*ctx)

typedef struct {
    ObHead
    const char * name;
    binfptr func_pointer;
} builtin_func;

typedef struct {
    ObHead
    method_ptr func_pointer;
} bin_method;

object* __bin_obdump    (binarg Args, struct ctx*);
object* __bin_range     (binarg Args, struct ctx*);
object* __bin_typeof    (binarg Args, struct ctx*);
object* __bin_object    (binarg Args, struct ctx*);
object* __bin_str       (binarg Args, struct ctx*);
object* __bin_array     (binarg Args, struct ctx*);
object* __bin_time      (binarg Args, struct ctx*);
object* __bin_id        (binarg Args, struct ctx*);
object* __bin_tojs      (binarg Args, struct ctx*);
extern const struct obtype BINTYPE;
extern const struct obtype BINMTYPE;
#endif /* builtin_h */
