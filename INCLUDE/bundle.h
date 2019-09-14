//
//  bundle.c
//  dulang
//
//  Created by Дмитрий Маслюков on 08/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//
#ifndef BUNDLE
#define BUNDLE
#include "typeInterface.h"

typedef struct {
    ObHead
    int count;
    object*items[0];
} bundle;

object* _mktuple(object** stackptr, int num);
object* mktuple_va(int num, ...);
void destr_tuple(object*);
char* dump_tuple(object*);
object* tuple_method(object*, const char*, object*);
object* tuple_sub_get(object*self, object*pos);
void tuple_sub_set(object*self, object*pos, object*);
extern const struct obtype BUNDLETYPE;
#endif
