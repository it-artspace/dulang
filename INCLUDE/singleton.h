//
//  singleton.h
//  dulang
//
//  Created by Дмитрий Маслюков on 18/07/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#ifndef singleton_h
#define singleton_h

#include "typeInterface.h"
/*
 singletons are presented via hashtable providing O(1) lookup time (~30 ns)
 
 */

typedef struct _shape{
    ObHead
    int len;
    int cap;
    dulstring ** fieldnames;
    int children_count;
    int children_cap;
    struct{
        dulstring * transition;
        struct _shape * descendant;
    } * children;
} shapeobject;
typedef struct {
    ObHead
    shapeobject * shape;
    object ** f_values;
} single_ob;

typedef struct {
    ObHead
    single_ob*obj;
    int pos;
} obj_iterator;

object* new_ob(void);
void init_shapes(void);
#define ob_sub_offt(o, offt) (((single_ob*)o)->f_values[offt])
int dulshape_get_offset(shapeobject*, object * key);
//returns the idx of new prop
int dulshape_transit(single_ob*, dulstring* prop);
//returns index of prop for inline caching
int dulshape_set_prop(single_ob * ob, dulstring * key);


char ob_contains_field  (const object*self, const object*);
object* ob_subscr_get   (const object*self, object*);
void ob_subscr_set      (object*, object*, object*);
object* ob_method_call  (object*, const char*, object*, struct ctx*);
extern const struct obtype SINOBTYPE;
char*   dump_object     (object*self);
void obj_dealloc(object*self);


object* init_obj_iter     (const object*);
object* obj_iter_next     (object*);
object* unpack_obj_iter   (const object*);


#endif /* singleton_h */
