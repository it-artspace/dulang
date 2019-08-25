//
//  array.h
//  NIolang
//
//  Created by Дмитрий Маслюков on 18/08/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#ifndef array_h
#define array_h

#include "typeInterface.h"

typedef struct {
    ObHead
    int elem_count;
    int cap;
    object** items;
} dularray;

extern const struct obtype ARRTYPE;
extern const struct obtype ARRITER;
object* array_subscr_get(object*, object*);
void array_subscr_set(object*, object*, object*);
METHOD_DECL(length);
METHOD_DECL(append);
struct arr_iter{
    ObHead
    dularray * arr;
    dulnumber * pos;
};



#endif /* array_h */
