//
//  tuple.c
//  dulang
//
//  Created by Дмитрий Маслюков on 18/07/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../api.h"


typedef struct {
    ObHead
    object * pos;
    object * coll;
} tuple_iter;

object * unpack_ti(object * i){
    return tuple_sub_get(((tuple_iter*)i)->coll, ((tuple_iter*)i)->pos);
}

object * ti_next(object *ti){
    tuple_iter * i = (tuple_iter*)ti;
    bundle * b = i->coll;
    dulnumber* pos = i->pos;
    if(pos->refcnt > 1){
        i->pos = pos = numfromdouble(pos->val);
    }
    pos->val++;
    if(pos->val >= b->count){
        free(ti);
        return 0;
    }
    return ti;
}

const struct obtype ti_type = {
    .iter_next = &ti_next,
    .unpack_iter = &unpack_ti
};

object * init_tuple_iter(object * tuple){
    tuple_iter * i = malloc(sizeof(tuple_iter));
    i->pos = numfromdouble(0);
    i->coll = tuple;
    i->refcnt = 1;
    i->type = &ti_type;
    return (object*)i;
}


object* tuple_sub_get(object*self, object*pos){
    if(!pos || pos->type->type_id != number_id)
        return 0;
    dulnumber* p = (dulnumber*)pos;
    bundle*b = (bundle*)self;
    if(p->val < 0 || p->val>= b->count)
        return 0;
    return b->items[(int)p->val];
}

void tuple_sub_set(object*self, object*pos, object*val){
    if(!pos || pos->type->type_id != number_id)
        return;
    dulnumber* p = (dulnumber*)pos;
    bundle*b = (bundle*)self;
    if(p->val < 0 || p->val> b->count){
        fprintf(stderr, "out of index-error");
        return;
    }
    b->items[(int)p->val] = val;
    INCREF(val);
}


object* mktuple_va(int num, ...){
    bundle * t = malloc(sizeof(bundle) + num * sizeof(object*));
    t->count = num;
    t->refcnt = 0;
    t->type = &BUNDLETYPE;
    va_list ap;
    va_start(ap, num);
    for(int i = 0; i<num; ++i){
        t->items[i] = va_arg(ap, object*);
        INCREF(t->items[i]);
    }
    va_end(ap);
    return (object*)t;
}




const struct obtype BUNDLETYPE = {
    "bundle",
    &dump_tuple, //dump
    0, //alloc
    &destr_tuple, //dealloc
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
    &init_tuple_iter, //init_iter (collection initializes iter)
    0, //next_iter
    &tuple_sub_get, // [0]
    &tuple_sub_set, // [0] =
    0, // tostr
    0, //copy
    0, //unpack,
    tuple_id,
    
};



const builtin_func map = {
    &BINTYPE,
    1,
    "map",
    
};


object* _mktuple(object** stackptr, int num){
    bundle* b = (bundle*)dulalloc(sizeof(bundle) + sizeof(object*) * num);
    b->count = num;
    b->refcnt = 0;
    b->type = &BUNDLETYPE;
    for(object** ptr = stackptr - num; ptr!=stackptr; ++ptr){
        b->items[num +(ptr - stackptr)] = *ptr;
        INCREF(*ptr)
    }
    return (object*)b;
}

void destr_tuple(object * ob){
    bundle* o = (bundle*)ob;
    for(int i = 0; i<o->count; ++i)
        DECREF(o->items[i]);
}

char* dump_tuple(object * t){
    bundle* ob = (bundle*)t;
    char* dump = (char*)dulalloc(1000);
    char*writer = dump;
    *writer++ = '(';
    for(int i = 0; i<ob->count; ++i){
        if(ob->items[i]){
            char* iter_dump = ob->items[i]->type->dump(ob->items[i]);
            writer+= sprintf(writer, "%s", iter_dump);
            free(iter_dump);
        }
        else
            writer+= sprintf(writer, "null");
        if(i!= ob->count - 1){
            *writer++=',';
            *writer++ =' ';
            
        }
    }
    *writer++=')';
    *writer = 0;
    return dump;
}
