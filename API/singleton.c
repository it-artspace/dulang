//
//  singleton.c
//  dulang
//
//  Created by Дмитрий Маслюков on 18/07/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../api.h"

object* new_ob(void){
    single_ob* obj = (single_ob*)dulalloc(sizeof(single_ob));
    obj->refcnt = 0;
    obj->type = &SINOBTYPE;
    obj->shape = get_root();
    obj->f_values = malloc(sizeof(object*)*obj->shape->cap);
    return (object*)obj;
}

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





object* ob_subscr_get   (const object*self, object * s_name){
    single_ob*t = (single_ob*)self;
    int pos = dulshape_get_offset(t->shape, s_name);
    object * result = pos>=0?t->f_values[pos]:0;
    //printf("pos = %d, result = %p", pos, result);
    
    return result;
}

void ob_subscr_set(object*self, object*name, object*target){
    if(target)
        INCREF(target);
    if(target && target->type->type_id == func_id){
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
    if(name->type->type_id != string_id){
        return;
    }
    single_ob * t = (single_ob*)self;
    int pos = dulshape_get_offset(t->shape, name);
    if(pos >= 0){
        DECREF(t->f_values[pos]);
        t->f_values[pos] = target;
    } else {
        //need transition
        int idx = dulshape_transit(t, (dulstring*)name);
        t->f_values[idx] = target;
    }
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
    if(s->shape->len == 0)
        return strdup("{}");
    char* dump = (char*)dulalloc(10000);
    char*writer = dump;
    writer+= sprintf(writer, "{");
    for(int i = 0; i<s->shape->cap;++i){
        if(s->shape->fieldnames[i]){
            writer+= sprintf(writer, "\"%s\": ", s->shape->fieldnames[i]->content);
            object * member = s->f_values[i];
            if(member->type->dump){
                char*localdump = member->type->dump(member);
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
    if(!self->shape)
        return;
    for(int i = 0; i <self->shape->cap; ++i){
        if(self->shape->fieldnames[i])
            DECREF(self->f_values[i]);
    }
    free(self->f_values);
    
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
    for(i = 0; i<((single_ob*)o)->shape->cap && !new_iter->obj->shape->fieldnames[i]; ++i);
    if(i == ((single_ob*)o)->shape->cap){
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
        
    }while(i->pos < i->obj->shape->cap && !i->obj->shape->fieldnames[i->pos]);
    if(i->pos == i->obj->shape->cap){
        free(i);
        return 0;
    }
    return iter;
}

object* unpack_obj_iter   (const object*i){
    obj_iterator*iter = (obj_iterator*)i;
    return iter->obj->shape->fieldnames[iter->pos];
}

char ob_contains_field  (const object*self, const object*other){
    if(strcmp(other->type->name, "string")!=0){
        return 0;
    }
    dulstring* str = (dulstring*)other;
    return ob_subscr_get(self, str) != 0;
}
/**
 retuns a copy of object
 */
///<name = "src">object that is typesafe</name>
object * copy_object (object * src){
    object * o = new_ob();
    single_ob * self = (single_ob*)src;
    for(int i = 0; i< self->shape->cap; ++i){
        if(self->shape->fieldnames[i]){
            ob_subscr_set(o, self->shape->fieldnames[i], self->f_values[i]);
        }
    }
    return o;
}
