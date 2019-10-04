//
//  dulint.c
//  NIolang
//
//  Created by Дмитрий Маслюков on 23/09/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../api.h"

object * dulIntPlusInt(object * left, object * right){
    int leftVal = ((int *)(&left))[0];
    int rightVal = ((int *)(&right))[0];
    leftVal += rightVal;
    int result[2];
    result[1] = 1;
    result[0] = leftVal;
    object * res;
    memcpy(&res, result, sizeof(object*));
    return res;
}
