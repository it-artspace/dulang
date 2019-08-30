//
//  rangeobject.h
//  dulang
//
//  Created by Дмитрий Маслюков on 18/07/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#ifndef rangeobject_h
#define rangeobject_h

#include "typeInterface.h"
#include "number.h"
typedef struct {
    ObHead
    int start;
    int end;
    int step;
} rangeobject;

typedef struct {
    ObHead
    rangeobject* coll;
    dulnumber  * pos;
} range_iter;

object* init_range_iter     (const object*);
object* range_iter_next     (object*);
object* unpack_range_iter   (object*);
extern const struct obtype RANGEOBJECTTYPE;
#endif /* rangeobject_h */
