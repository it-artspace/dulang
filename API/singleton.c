//
//  singleton.c
//  dulang
//
//  Created by Дмитрий Маслюков on 18/07/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../api.h"

object* new_ob(void){
    single_ob* obj = (single_ob*)malloc(sizeof(single_ob));
    obj->refcnt = 0;
    obj->type = &SINOBTYPE;
    obj->count = 0;
    obj->cap = 256;
    for(int i = 0; i<256; ++i)
        obj->content[i].is_valid = 1;
    return (object*)obj;
}

object* ob_subscr_get   (const object*self, const char*name){
    single_ob*t = (single_ob*)self;
    unsigned int index = hashstr(name) % t->cap;
    unsigned int ini_index = index;
    while(strcmp(name, t->content[index].name) != 0){
        /*if(t->content[index].is_valid == 1)
            return 0;*/
        index = (index*5 +1) % t->cap;
        if(index == ini_index)
            return 0;
    }
    return t->content[index].member;
}

void ob_subscr_set(object*self, const char*name, object*target){
    INCREF(target);
    single_ob* table = (single_ob*)self;
    if(table->count *2 >= table->cap){
        table = realloc(table, sizeof(single_ob) + sizeof(object*)*(table->cap*=2));
    }
    unsigned int index = hashstr(name) % table->cap;
    
    while(strcmp(name, table->content[index].name) != 0){
        if(table->content[index].is_valid == 1){
            //can be inserted here
            break;
        }
        
        index = (index*5 +1) % table->cap;
    }
    table->content[index].member = target;
    table->content[index].is_valid = 0;
    strcpy(table->content[index].name, name);
    table->count++;
}



const struct obtype SINOBTYPE = {
    "object",
    dump_object, //dump
    0, //alloc
    &obj_dealloc, //dealloc
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
    &ob_contains_field, // a in b
    &init_obj_iter, //init_iter (collection initializes iter)
    0, //next_iter
    0, // [0]
    0, // [0] =
    &ob_subscr_get, // [""]
    &ob_subscr_set, // [""] =
    0, // tostr
    0, //copy
    0,  //unpack,
    0
};

char*   dump_object     (object*self){
    single_ob* s = (single_ob*)self;
    char* dump = (char*)malloc(10000);
    char*writer = dump;
    writer+= sprintf(writer, "{");
    for(int i = 0; i<s->cap;++i){
        if(!s->content[i].is_valid){
            writer+= sprintf(writer, "%s: ", s->content[i].name);
            char*localdump = s->content[i].member->type->dump(s->content[i].member);
            writer+= sprintf(writer, "%s, ", localdump);
            free(localdump);
        }
        
        
    }
    if(writer!=dump){
        writer-=2;
    }
    *writer++ = '}';
    *writer = 0;
    return dump;
}

void obj_dealloc(object*s){
    single_ob*self = (single_ob*)s;
    for(int i = 0; i<256; ++i){
        if(!self->content[i].is_valid){
            DECREF(self->content[i].member);
        }
    }
}

const struct obtype OBJITERTYPE = {
    "object iterator",
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
    &obj_iter_next, //next_iter
    0, // [0]
    0, // [0] =
    0, // [""]
    0, // [""] =
    0, // tostr
    0, //copy
    &unpack_obj_iter,  //unpack,
    0, //method
    0
};

object* init_obj_iter(const object*o){
    //typesafe, doesnt need checks
    obj_iterator* new_iter = (obj_iterator*)malloc(sizeof(obj_iterator));
    new_iter->refcnt = 1;
    new_iter->type = &OBJITERTYPE;
    new_iter->obj = (single_ob*)o;
    int i;
    for(i = 0; i<256 && new_iter->obj->content[i].is_valid; ++i);
    if(i == 256){
        //empty
        free(new_iter);
        return 0;
    }
    new_iter->pos = i;
    return (object*)new_iter;
}


object* obj_iter_next(object*iter){
    obj_iterator* i = (obj_iterator*)iter;
    do{
        i->pos++;
        
    }while(i->pos < 256 && i->obj->content[i->pos].is_valid);
    if(i->pos == 256){
        free(i);
        return 0;
    }
    return iter;
}

object* unpack_obj_iter   (const object*i){
    obj_iterator*iter = (obj_iterator*)i;
    char*name = iter->obj->content[iter->pos].name;
    return strfromchar(name);
}

char ob_contains_field  (const object*self, const object*other){
    if(strcmp(other->type->name, "string")!=0){
        return 0;
    }
    dulstring* str = (dulstring*)other;
    return ob_subscr_get(self, str->content) != 0;
}
