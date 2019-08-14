//
//  classobject.h
//  dulang
//
//  Created by Дмитрий Маслюков on 12/06/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#ifndef classobject_h
#define classobject_h

#include "typeInterface.h"


typedef struct {
    ObHead
    int elemc;
    int cap;
    struct {
        char mark;
#define DXEMPTY 0
#define DXUSED 1
        char key[22];
        char type;
#define TYPE_STATIC 0
#define TYPE_METHOD 1
#define TYPE_FIELD 2
        union{
            object* val; //function or static field
            unsigned int idx;
        };
    } table [0];
} classob;

typedef struct {
    ObHead
    classob* interface;
    object* elems[0];
} cl_instance;

object* new_classob(void);
object* invoke_constructor(object*, object* Args);
void add_attr(object*, const char*);
void set_attr(object*, const char*, object*);
object* get_attr(object*, const char*);

#endif /* classobject_h */
