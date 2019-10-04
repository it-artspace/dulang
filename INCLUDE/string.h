//
//  string.h
//  dulang
//
//  Created by Дмитрий Маслюков on 02/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#ifndef string_h
#define string_h
#include "typeInterface.h"
#include <string.h>
typedef struct{
    ObHead
    int len;
    int cap;
    char is_copy; //this flag means that content was allocated somewhere else and here we cannot free it, for example it is a substring
    char is_cons;
    union{
        char*content;
        struct {
            object * left;
            object * right;
        } cons;
    };
    unsigned int hash;
    
} dulstring;

object* concatstr(object*, object*);
object* allocstr(void);
void destrstr(object*);
int strleng(object*);
object * str_iadd(object * left, object * right);
char* dumpstr(object*self);
object* strfromchar(char*);
object* strfromnchar(char * source, int len);
object* getSubstring(object*str, int posstart, int posend);
#endif /* string_h */
