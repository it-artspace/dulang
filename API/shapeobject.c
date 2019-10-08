//
//  shapeobject.c
//  NIolang
//
//  Created by Дмитрий Маслюков on 07/10/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include <api.h>
static shapeobject * root;

int dul2pow(int len, int cap){
    //checks if len + 1 overcomes 50% of cap and returns appropriate capacity
    //cap is power of 2 so is returned
    return cap << ((len++<<1) >= cap);
    
}

char fast_str_check(object * str1, object *str2){
    if(!str1 || !str2)
        return 0;
    dulstring * s1 = (dulstring*)str1;
    dulstring * s2 = (dulstring*)str2;
    int len1 = s1->len;
    int len2 = s2->len;
    if(s1->hash != s2->hash)
        return 0;
    if(len1 != len2)
        return 0;
    //lets treat as int to reduce register pushes
    for(int i = 0; i < len1;++i){
        if(s1->content[i] != s2->content[i])
            return 0;
    }
    return 1;
}

void init_shapes(){
    root = malloc(sizeof(shapeobject));
    root->children_count = 0;
    root->children_cap = 15;
    root->children = malloc(sizeof(*root->children)*15);
    root->len = 0;
    root->cap = 32;
    root->fieldnames = malloc(sizeof(dulstring*)*32);
    bzero(root->fieldnames, root->cap * sizeof(object*));
}

int dulshape_get_offset(shapeobject*shape, object * key){
    if(shape->len == 0)
        return -1;
    dulstring * s = (dulstring*)key;
    unsigned int idx = s->hash % shape->cap;
    int counter = 0;
    while(!fast_str_check((object*)shape->fieldnames[idx], key)){
        idx = (5 * idx + 1) % shape->cap;
        if(++counter == shape->cap)
            return -1;
    }
    return idx;
}

int dulshape_transit(single_ob * obj, dulstring * prop){
    shapeobject * parent = obj->shape;
    shapeobject * new_shape = malloc(sizeof(shapeobject));
    new_shape->children_count = 0;
    new_shape->children_cap = 15;
    new_shape->children = malloc(sizeof(*root->children)*15);
    new_shape->fieldnames = malloc(sizeof(dulstring*)*dul2pow(parent->len, parent->cap));
    new_shape->cap = dul2pow(parent->len, parent->cap);
    bzero(new_shape->fieldnames, new_shape->cap * sizeof(object*));
    object ** old_values = obj->f_values;
    obj->f_values = malloc(sizeof(object*)*new_shape->cap);
    new_shape->len = parent->len + 1;
    //need to recount indexes
    for(int i = 0; i < parent->cap; ++i){
        if(parent->fieldnames[i]){
            int new_idx = parent->fieldnames[i]->hash % new_shape->cap;
            while(new_shape->fieldnames[new_idx])
                new_idx = (5 * new_idx + 1) % new_shape->cap;
            new_shape->fieldnames[new_idx] = parent->fieldnames[i];
            INCREF(parent->fieldnames[i]);
            obj->f_values[new_idx] = old_values[i];
        }
    }
    int idx = prop->hash % new_shape->cap;
    while(new_shape->fieldnames[idx])
        idx = (5 * idx + 1) % new_shape->cap;
    new_shape->fieldnames[idx] = prop;
    INCREF(prop);
    obj->shape = new_shape;
    free(old_values);
    return idx;
}

object* new_ob(void){
    single_ob* obj = (single_ob*)dulalloc(sizeof(single_ob));
    obj->refcnt = 0;
    obj->type = &SINOBTYPE;
    obj->shape = root;
    obj->f_values = 0;
    return (object*)obj;
}

