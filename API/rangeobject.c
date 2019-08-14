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
    0, // [""]
    0, // [""] =
    0, // tostr
    0, //copy
    &unpack_range_iter,  //unpack,
    0, //invoke (deprecated)
    -1, //typeid
    0, // methodnum
    0 //methodarray
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

object* init_range_iter(const object* r){
    range_iter* i = (range_iter*)malloc(sizeof(range_iter));
    i->refcnt = 1;
    i->type = &RANGEITERTYPE;
    i->coll = (rangeobject*)r;
    i->pos = ((rangeobject*)r)->start;
    return (object*)i;
}

object* range_iter_next(object* iter){
    range_iter* ri = (range_iter*)iter;
    ri->pos += ri->coll->step;
    int min_range_interval = ri->coll->start<ri->coll->end?ri->coll->start:ri->coll->end;
    int max_range_interval = ri->coll->start>ri->coll->end?ri->coll->start:ri->coll->end;
    if(ri->pos >= max_range_interval || ri->pos < min_range_interval){
        free(iter);
        return 0;
    }
    return iter;
}

object* unpack_range_iter   (const object*iter){
    return numfromdouble(((range_iter*)iter)->pos);
}
