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



#endif /* array_h */
