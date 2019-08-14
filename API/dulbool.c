//
//  dulbool.c
//  dulang
//
//  Created by Дмитрий Маслюков on 17/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../api.h"
const struct obtype BOOLTYPE = {
    "boolean",
    &dumpbool
};

char* dumpbool(object*self){
    char* str = (char*)malloc(16);
    strcpy(str, "");
    if(((dulbool*)self)->val)
        strcpy(str, "true");
    else
        strcpy(str, "false");
    return str;
}

object* boolfromlexem(char*src){
    dulbool* newbool = (dulbool*)malloc(sizeof(dulbool));
    newbool->refcnt = 0;
    newbool->type = &BOOLTYPE;
    newbool->val = src?1:0;
    return (object*)newbool;
}
