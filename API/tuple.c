//
//  tuple.c
//  dulang
//
//  Created by Дмитрий Маслюков on 18/07/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../api.h"

object* __bin_tuple_map(object*s, binarg A, struct _crt* coro){
    if(A.a_passed > 1){
        fprintf(stderr, "only one argument expected at tuple-map method");
        return 0;
    }
    bundle*self = (bundle*)s;
    
    object* arg = *A.aptr;
    if(strcmp(arg->type->name, "functional object") == 0){
        funcobject*f = (funcobject*)arg;
        bundle* nb = (bundle*)dulalloc(sizeof(bundle) + sizeof(object*)*self->count);
        nb->refcnt = 0;
        nb->type = &BUNDLETYPE;
        nb->count = self->count;
        for(int i = 0; i<self->count; ++i){
            context*c = init_context(f, coro);
            while(c->inst_pointer != c->stop_ptr)
                exec_context(c);
            //here it returns
        }
        
        return (object*)nb;
    }
    fprintf(stderr, "object of unexpected type %s forwarded to map-method", arg->type->name);
    return 0;
    
    
   
}

object* tuple_sub_get(object*self, object*pos){
    if(!pos || pos->type->type_id != number_id)
        return 0;
    dulnumber* p = (dulnumber*)pos;
    bundle*b = (bundle*)self;
    if(p->val < 0 || p->val> b->count)
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
    0, //init_iter (collection initializes iter)
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
