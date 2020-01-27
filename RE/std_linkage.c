//
//  std_linkage.c
//  dulang
//
//  Created by Дмитрий Маслюков on 18/07/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../api.h"
#include <stdlib.h>

#define DULMIN(a,b) a<b?a:b

builtin_func dump = {
    &BINTYPE,
    1,
    "obdump",
    &__bin_obdump
};

builtin_func range = {
    &BINTYPE,
    1,
    "range",
    &__bin_range
};

builtin_func obj = {
    &BINTYPE,
    1,
    "object",
    &__bin_object
};

builtin_func typeof_ = {
    &BINTYPE,
    1,
    "typeof",
    &__bin_typeof
};

builtin_func str_ = {
    &BINTYPE,
    1,
    "str",
    &__bin_str
};

builtin_func chan_ = {
    &BINTYPE,
    1,
    "channel",
    &Dulnew_channel
};

builtin_func id_ = {
    &BINTYPE,
    1,
    "id",
    &__bin_id
};

builtin_func time_ = {
    &BINTYPE,
    1,
    "time",
    &__bin_time
};
builtin_func array = {
    &BINTYPE,
    1,
    "array",
    &__bin_array
};
builtin_func tojs = {
    &BINTYPE,
    1,
    "toJS",
    &__bin_tojs
};

builtin_func *bins[] = {&dump, &typeof_, &range, &obj, &str_, &chan_, &time_, &array, &id_, &tojs};
const int bin_count = sizeof(bins)/sizeof(object*);

void eval_std (context*ctx){
    for(int i = 0; i<ctx->co_static->namecount; ++i){
        for(int bin_iter = 0; bin_iter < bin_count; ++bin_iter){
            if(strcmp(ctx->co_static->varnames[i], bins[bin_iter]->name) == 0)
                ctx->vars[i] = (object*)bins[bin_iter];
        }
    }
}
