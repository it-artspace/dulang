//
//  number.h
//  dulang
//
//  Created by Дмитрий Маслюков on 16/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#ifndef number_h
#define number_h
#include "typeInterface.h"
typedef struct {
    ObHead
    int n_type;
    union{
        double val;
        long long i_val;
    };
} dulnumber;
extern const struct obtype NUMTYPE;
object* numfromdouble(double);
object* numfromlong(long);
char* dumpnumber (object*);
void num_dealloc(object*);
object* numplus(object*, object*);
object* numminus(object*, object*);
object* nummult(object*, object*);
object* numdiv(object*, object*);
#define NumValOf(o) (o->n_type?o->i_val:o->val)
#endif /* number_h */
