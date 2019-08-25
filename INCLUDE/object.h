//
//  object.h
//  dulang
//
//  Created by Дмитрий Маслюков on 02/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#ifndef object_h
#define object_h
#include <stdio.h>
struct obtype;
typedef struct dulobject {
#define ObHead const struct obtype*type;\
    int refcnt;
    ObHead;
} object;
void ob_dealloc(object*);
extern FILE* alloc_log;
void*   dulalloc(unsigned long);
void    dulfree(void*);
void    dulfree_ob(void*);
void*   ob_alloc(unsigned long);
void setup_aa(void);
#define INCREF(obptr) if (obptr) (obptr)->refcnt++;
#define DECREF(obptr) if(!--(obptr)->refcnt) ob_dealloc(obptr);

#endif /* object_h */
