//
//  rangeobject.c
//  dulang
//
//  Created by Дмитрий Маслюков on 18/07/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../api.h"

const struct obtype RANGEITERTYPE = {
    "range iterator",
    0, //dump
    0, //alloc
    0, //dealloc
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
    &range_iter_next, //next_iter
    0, // [0]
    0, // [0] =
    0, // tostr
    0, //copy
    &unpack_range_iter,  //unpack,

    -1, //typeid
};

const struct obtype RANGEOBJECTTYPE = {
        "range object",
        0, //dump
        0, //alloc
        0, //dealloc
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
        &init_range_iter
};

object* init_range_iter(object* r){
    range_iter* i = (range_iter*)malloc(sizeof(range_iter));
    i->refcnt = 1;
    i->type = &RANGEITERTYPE;
    rangeobject* range = (rangeobject*)r;
    i->start = range->start;
    i->step = range->step;
    i->end = range->end;
    i->pos = (dulnumber*)numfromlong(range->start);
    i->pos->refcnt = 1;
    return (object*)i;
}

object* range_iter_next(object* iter){
    range_iter* ri = (range_iter*)iter;
    if(ri->pos->refcnt > 1){
        ri->pos = (dulnumber*)numfromlong(ri->pos->i_val);
        INCREF(ri->pos);
    }
    ri->pos->i_val += ri->step;
    int val = (int)ri->pos->i_val;
    int start = ri->start;
    int stop = ri->end;
    //the following checks the signs of interval bounds
    //the idea: while iterator is within bounds it gets different signs no matter the
    //direction of iteration is
    // >>31 gets the first bit that is 1 when number is negative
    // and then we use XOR to assume that only one is negative
    // ++val is not to hit the bound
    if(!(
        (val - start)>>31 ^ (++val - stop)>>31
    )){
        free(iter);
        return 0;
    }
    return iter;
}

object* unpack_range_iter   (object*iter){
    return (object*)((range_iter*)iter)->pos;
}
