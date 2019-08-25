//
//  exprobject.h
//  NIolang
//
//  Created by Дмитрий Маслюков on 21/08/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#ifndef exprobject_h
#define exprobject_h
#include "typeInterface.h"
#include "funcobject.h"
//one or more lines short inlined expression that doesnt fit regular instruction stream

typedef struct {
    ObHead
    int bytecount;
    int bytecap;
    struct op * return_to;
    struct op *ops;
    funcobject* inlined_in;
} exprobject;

exprobject* new_exprobject(void);
extern const struct obtype EXPRTYPE;


#endif /* exprobject_h */
