//
//  hashname.c
//  dulang
//
//  Created by Дмитрий Маслюков on 13/06/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../api.h"
#include <string.h>
unsigned int hashstr(const char*str){
    int res = 0;
    for(int i = 0; i<strlen(str);++i){
        res+=(str[i]-'A');
        res*=POL;
    }
    return res;
}
