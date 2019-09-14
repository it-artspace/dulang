//
//  singleton.c
//  dulang
//
//  Created by Дмитрий Маслюков on 18/07/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../api.h"
char * dump_method(object*m){
    char * mem = malloc(50);
    dulmethod * method = (dulmethod*)m;
    sprintf(mem, "method at %lX bound to %lX", (size_t)method->executable, (size_t)method->instance);
    return mem;
}

void destroy_method(object * m){
    dulmethod * method = (dulmethod*)m;
    DECREF(method->executable);
    DECREF(method->instance);
}
const struct obtype METHODTYPE = {
    "method",
    &dump_method, //dump
    0, //alloc
    &destroy_method, //dealloc
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
    0, // [0]
    0, // [0] =
    0, // tostr
    0, //copy
    0,  //unpack,
    method_id //typeid
};

char fast_str_check(object * str1, object *str2){
    if(!str1 || !str2)
        return 0;
    dulstring * s1 = (dulstring*)str1;
    dulstring * s2 = (dulstring*)str2;
    if(s1->len != s2->len)
        return 0;
    for(int i = 0; i < s1->len; ++i){
        if(s1->content[i] != s2->content[i])
            return 0;
    }
    return 1;
}

object* new_ob(void){
    single_ob* obj = (single_ob*)dulalloc(sizeof(single_ob));
    obj->refcnt = 0;
    obj->type = &SINOBTYPE;
    obj->count = 0;
    obj->cap = 32;
    obj->content = malloc(sizeof(struct obentry)*32);
    for(int i = 0; i<32; ++i){
        obj->content[i].name = 0;
        obj->content[i].member = 0;
    }
    return (object*)obj;
}

object* ob_subscr_get   (const object*self, object * s_name){
    char*name = ((dulstring*)s_name)->content;
    single_ob*t = (single_ob*)self;
    unsigned int index = hashstr(name) % t->cap;
    int itercount = 0;
    while(t->content[index].name && !fast_str_check(t->content[index].name, s_name)){
        index = (index * 5 + 1) % t->cap;
        if(itercount++ == t->cap)
            return 0;
    }
    return t->content[index].member;
}

void ob_subscr_set(object*self, object*name, object*target){
    INCREF(target);
    if(target->type->type_id == func_id){
        //bin methods cannot be assigned here
        dulmethod * method = malloc(sizeof(dulmethod));
        method->refcnt = 1;
        method->instance = self;
        method->executable = target;
        method->type = &METHODTYPE;
        INCREF(self);
        target = (object*)method;
    }
    INCREF(name);
    single_ob* table = (single_ob*)self;
    char * rname = ((dulstring*)name)->content;
    if(table->count *2 >= table->cap){
        struct obentry * oldcontent = table->content;
        int oldcap = table->cap;
        table->content = malloc(sizeof(struct obentry)*(table->cap*=2));
        bzero(table->content, oldcap * 2 * sizeof(struct obentry));
        table->count = 0;
        for(int i = 0; i<oldcap; ++i){
            if(oldcontent[i].name)
                ob_subscr_set(self, oldcontent[i].name, oldcontent[i].member);
        }
        free(oldcontent);
#warning TODO: index recount
    }
    unsigned int index = hashstr(rname) % table->cap;
    struct obentry * head = (table->content + index);
    if(!(head->name)){
        //can be inserted just here, most commonly used case
        head->name = name;
        table->count++;
        head->member = target;
        return;
    }
    //actually we are guaranteed with free place for insertion by ratio 1 : 2

    while(table->content[index].name){
        if(fast_str_check(table->content[index].name, name)){
            //insertion on existing
            if((table->content + index)->member)
                DECREF(table->content[index].member);
            (table->content + index)->member= target;
            (table->content + index)->name = name;
            return;
        }
        index = (index * 5 + 1) % table->cap;
    }
    table->count ++;
    (table->content + index)->name = name;
    (table->content + index)->member = target;
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
    &ob_subscr_get, // [""]
    &ob_subscr_set, // [""] =
    0, // tostr
    0, //copy
    0,  //unpack,
    object_id
};


char*   dump_object     (object*self){
    single_ob* s = (single_ob*)self;
    if(s->count == 0)
        return strdup("{}");
    char* dump = (char*)dulalloc(10000);
    char*writer = dump;
    writer+= sprintf(writer, "{");
    for(int i = 0; i<s->cap;++i){
        if(s->content[i].name){
            writer+= sprintf(writer, "%s: ", ((dulstring*)s->content[i].name)->content);
            object * member = s->content[i].member;
            if(member->type->dump){
                char*localdump = s->content[i].member->type->dump(s->content[i].member);
                writer+= sprintf(writer, "%s, ", localdump);
                free(localdump);
            } else {
                writer+= sprintf(writer, "%s at %p, ", member->type->name, member);
            }
            
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
    for(int i = 0; i<32; ++i){
        if(self->content[i].member){
            DECREF(self->content[i].member);
            DECREF(self->content[i].name);
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
    0, // tostr
    0, //copy
    &unpack_obj_iter,  //unpack,
    -1
};

object* init_obj_iter(const object*o){
    //typesafe, doesnt need checks
    obj_iterator* new_iter = (obj_iterator*)dulalloc(sizeof(obj_iterator));
    new_iter->refcnt = 1;
    new_iter->type = &OBJITERTYPE;
    new_iter->obj = (single_ob*)o;
    int i;
    for(i = 0; i<((single_ob*)o)->cap && !new_iter->obj->content[i].name; ++i);
    if(i == ((single_ob*)o)->cap){
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
        
    }while(i->pos < i->obj->cap && !i->obj->content[i->pos].name);
    if(i->pos == i->obj->cap){
        free(i);
        return 0;
    }
    return iter;
}

object* unpack_obj_iter   (const object*i){
    obj_iterator*iter = (obj_iterator*)i;
    return iter->obj->content[iter->pos].name;
}

char ob_contains_field  (const object*self, const object*other){
    if(strcmp(other->type->name, "string")!=0){
        return 0;
    }
    dulstring* str = (dulstring*)other;
    return ob_subscr_get(self, str) != 0;
}
