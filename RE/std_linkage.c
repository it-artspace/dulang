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

const builtin_func dump = {
    &BINTYPE,
    1,
    "obdump",
    &__bin_obdump
};

const builtin_func range = {
    &BINTYPE,
    1,
    "range",
    &__bin_range
};

const builtin_func obj = {
    &BINTYPE,
    1,
    "object",
    &__bin_object
};

const builtin_func typeof_ = {
    &BINTYPE,
    1,
    "typeof",
    &__bin_typeof
};

const builtin_func str_ = {
    &BINTYPE,
    1,
    "str",
    &__bin_str
};


const builtin_func *bins[] = {&dump, &typeof_, &range, &obj, &str_};
const int bin_count = 5;

void eval_std (context*ctx){
    for(int i = 0; i<ctx->co_static->namecount; ++i){
        for(int bin_iter = 0; bin_iter < bin_count; ++bin_iter){
            if(strcmp(ctx->co_static->varnames[i], bins[bin_iter]->name) == 0)
                ctx->vars[i] = (object*)bins[bin_iter];
        }
    }
}
