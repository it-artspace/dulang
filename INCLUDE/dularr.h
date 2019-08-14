//
//  dularr.h
//  dulang
//
//  Created by Дмитрий Маслюков on 18/07/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#ifndef dularr_h
#define dularr_h

#include "typeInterface.h"

typedef struct {
    ObHead
    object** elems;
    int count;
    int cap;
} dularray;

#endif /* dularr_h */
