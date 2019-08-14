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

typedef object* (*binfptr) (binarg Args, struct _crt * coro);

typedef struct {
    ObHead
    const char * name;
    binfptr func_pointer;
} builtin_func;

object* __bin_obdump    (binarg Args, struct _crt * coro);
object* __bin_range     (binarg Args, struct _crt * coro);
object* __bin_typeof    (binarg Args, struct _crt * coro);
object* __bin_object    (binarg Args, struct _crt * coro);

extern const struct obtype BINTYPE;
#endif /* builtin_h */
