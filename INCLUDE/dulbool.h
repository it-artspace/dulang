//
//  dulbool.h
//  dulang
//
//  Created by Дмитрий Маслюков on 17/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#ifndef dulbool_h
#define dulbool_h

#include "typeInterface.h"

typedef struct {
    ObHead
    char val:1;
} dulbool;

object* boolfromlexem(char );
char* dumpbool(object*);
extern const struct obtype BOOLTYPE;

#endif /* dulbool_h */
