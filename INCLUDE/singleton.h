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
typedef struct {
    ObHead
    int count;
    int cap;
    struct {
        char name [20];
        char is_valid;
        object* member;
    } content[256];
} single_ob;

typedef struct {
    ObHead
    single_ob*obj;
    int pos;
} obj_iterator;

object* new_ob(void);
char ob_contains_field  (const object*self, const object*);
object* ob_subscr_get   (const object*self, const char*);
void ob_subscr_set      (object*, const char*, object*);
object* ob_method_call  (object*, const char*, object*, struct ctx*);
extern const struct obtype SINOBTYPE;
char*   dump_object     (object*self);
void obj_dealloc(object*self);

object* init_obj_iter     (const object*);
object* obj_iter_next     (object*);
object* unpack_obj_iter   (const object*);


#endif /* singleton_h */
