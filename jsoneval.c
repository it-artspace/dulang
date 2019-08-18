//
//  jsoneval.c
//  NIolang
//
//  Created by Дмитрий Маслюков on 18/08/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include "api.h"
object* parse_wrapper(char*, int);
char* delete_ws(const char* source, int len){
    //returns newly allocated string without whitespaces that needs to be freed after use
    // we do always know the length of the string so dont need to count strlen every time (it can be CPU expensive)
    char* result = (char*)malloc(len + 1);
    char* writer = result;
    int symignore = 0;
    for(const char* reader = source; reader < source + len; ++reader){
        if(*reader != ' ')
            *writer++ = *reader;
        else if(symignore)
            *writer++ = *reader;
        if(*reader == '"')
            symignore = !symignore;
    }
    *writer = 0;
    return result;
}


object* parse_js_object(char* src, int len){
    char* iter = src;
    object* o = new_ob();
    while(iter < src + len){
        char* keybegin = iter;
        while(iter < src + len && *iter!=':' && isalnum(*iter))
            iter++;
        if(*iter!=':'){
            //raise error
            obj_dealloc(o);
            return 0;
        }
        char * key = strndup(keybegin, iter - keybegin - 1);
        char * valbegin = ++iter;
        int depth = 0;
        int symignore = 0;
        
    }
    return o;
}




object* jsoneval(binarg Args, struct _crt* _){
    return 0;
}

FILE* output;
int main(void){
    
    char* srcstr = "{a:\"s\",b:[1, 2, \"sytry \"]}";
    printf("%s", delete_ws(srcstr, strlen(srcstr)));
}
