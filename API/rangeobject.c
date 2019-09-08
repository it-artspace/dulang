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
    i->coll = (rangeobject*)r;
    i->pos = (dulnumber*)numfromdouble(((rangeobject*)r)->start);
    i->pos->refcnt = 1;
    return (object*)i;
}

object* range_iter_next(object* iter){
    range_iter* ri = (range_iter*)iter;
    if(ri->pos->refcnt > 1){
        ri->pos = numfromdouble(ri->pos->val);
    }
    ri->pos->val += ri->coll->step;
    int min_range_interval = ri->coll->start<ri->coll->end?ri->coll->start:ri->coll->end;
    int max_range_interval = ri->coll->start>ri->coll->end?ri->coll->start:ri->coll->end;
    if(ri->pos->val >= max_range_interval || ri->pos->val < min_range_interval){
        free(iter);
        return 0;
    }
    return iter;
}

object* unpack_range_iter   (object*iter){
    return (object*)((range_iter*)iter)->pos;
}
