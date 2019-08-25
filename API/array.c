//
//  array.c
//  NIolang
//
//  Created by Дмитрий Маслюков on 18/08/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../api.h"
object* array_subscr_get(object* self, object* index){
    if(index->type->type_id != number_id)
        return 0;
    dulnumber* i = (dulnumber*)index;
    dularray * arr = (dularray*)self;
    int pos = i->val;
    if(pos < 0)
        pos += arr->elem_count;
    if(pos < 0 || pos > arr->elem_count)
        return 0;
    return arr->items[pos];
}
void array_subscr_set(object* self, object* index, object* val){
    if(index->type->type_id != number_id)
        return;
    dulnumber* i = (dulnumber*)index;
    dularray * arr = (dularray*)self;
    int pos = i->val;
    if(pos < 0)
        pos += arr->elem_count;
    if(pos < 0 || pos > arr->elem_count)
        return;
    arr->items[pos] = val;
    INCREF(val);
}
METHOD_DECL(length){
    return (object*)numfromdouble(((dularray*)self)->elem_count);
}
METHOD_DECL(append){
    dularray * arr = (dularray*)self;
    for(object ** iter = Args.aptr; iter < Args.aptr + Args.a_passed; ++iter){
        if(arr->elem_count ++ == arr->cap){
            arr->items = realloc(arr->items, (arr->cap *=2)*sizeof(object*));
        }
        arr->items[arr->elem_count - 1] = *iter;
        INCREF(*iter);
    }
    return 0;
}
static struct {
    const char * name;
    bin_method m;
} arr_methods [] = {{
    "length", {
        &BINTYPE,
        1,
        &length
    }}, {
    "append", {
        &BINTYPE,
        1,
        &append
}}};
static int arr_mc = 2;

object * get_array_methods(){
    static object * arrm;
    if(arrm == 0){
        arrm = new_ob();
        for(int i = 0; i<arr_mc; ++i){
            ob_subscr_set(arrm, (object*)strfromchar(arr_methods[i].name), (object*)&arr_methods[i].m);
        }
    }
    return arrm;
}

void destr_array(object*o){
    dularray*self = (dularray*)o;
    free(self->items);
}

object * init_arr_iter(object * arr){
    dularray * self = (dularray*)arr;
    if(self->elem_count > 0){
        struct arr_iter * it = malloc(sizeof(struct arr_iter));
        it->refcnt = 1;
        it->type = &ARRITER;
        it->arr = self;
        INCREF(arr);
        it->pos = (dulnumber*)numfromdouble(0);
        return (object*)it;
    } else {
        return 0;
    }
}

char * dump_arr(object *a){
    dularray * self = (dularray*)a;
    char * buf = malloc(10000);
    char * writer = buf;
    *writer++ = '[';
    for(int i = 0; i<self->elem_count; ++i){
        char * localdump = self->items[i]->type->dump(self->items[i]);
        writer += sprintf(writer, "%s, ", localdump);
        free(localdump);
    }
    if(self->elem_count > 0)
        writer -=2;
    *writer++ = ']';
    *writer++ = '\0';
    return buf;
}

object* arr_iter_next(object * iter){
    struct arr_iter * i = (struct arr_iter*)iter;
    i->pos->val ++;
    if(i->pos->val >= i->arr->elem_count){
        free(iter);
        return 0;
    }
    if(i->pos->refcnt > 1){
        i->pos = (dulnumber*)numfromdouble(i->pos->val);
    }
    
    return iter;
}

object * unpack_arr_iter(object * i){
    struct arr_iter * iter = (struct arr_iter*)i;
    return (object*)(iter->arr->items[(int)iter->pos->val]);
}



const struct obtype ARRTYPE = {
    "array",
    &dump_arr, //dump
    0, //alloc
    &destr_array, //dealloc
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
    &init_arr_iter, //init_iter (collection initializes iter)
    0, //next_iter
    &array_subscr_get, // [0]
    &array_subscr_set, // [0] =
    0, // tostr
    0, //copy
    0,  //unpack,
    array_id, //typeid
    &get_array_methods// method
};

const struct obtype ARRITER = {
    "array iter",
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
    &arr_iter_next, //next_iter
    0, // [0]
    0, // [0] =
    0, // tostr
    0, //copy
    &unpack_arr_iter,  //unpack,
    -1, //typeid
    0// method
};
