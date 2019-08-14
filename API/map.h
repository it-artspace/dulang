//
//  map.h
//  NIolang
//
//  Created by Дмитрий Маслюков on 08/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#ifndef map_h
#define map_h

#include "typeInterface.h"


struct mapnode{
    struct mapnode*left;
    struct mapnode*right;
    struct mapnode*parent;
    char*name;
    int64_t hashed;
    object*val;
};
typedef struct {
    ObHead
    struct mapnode*head;
    int count;
} map;

#endif /* map_h */
