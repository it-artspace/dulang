//
//  dulmethod.h
//  NIolang
//
//  Created by Дмитрий Маслюков on 25/08/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#ifndef dulmethod_h
#define dulmethod_h

#include "typeInterface.h"

typedef struct {
    ObHead
    //is a wrapper around funcobject to appropriately pass methods to functions, e.g.
    /*
     a = object{
        this.x = 200
        this.f = fun()
            write this.x
     }
     
     fun trigger(callback)
        callback()
     
     trigger(a.f)
    */
    // we expect 200 to be written
    object * instance;
    object * executable;
} dulmethod;


#endif /* dulmethod_h */
