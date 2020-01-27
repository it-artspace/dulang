//
//  asttoJS.h
//  NIolang
//
//  Created by Дмитрий Маслюков on 24/08/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#ifndef asttoJS_h
#define asttoJS_h
#include "../api.h"

typedef struct _nanode{
    int nc;
    int namecap;
    char ** names;
    struct _nanode * next;
} namearr;

typedef struct {
    char fname [300];
    int cur_indent;
    char * content;
    int clength;
    int ccap;
    namearr framestack[100];
    int framepos;
} jswriter;



jswriter * init_writer(char* modname);
void jswrite_node   (jswriter*, astnode*);
void jswrite_sym    (jswriter*, char*, int);
void jswrite_tofile (jswriter*, char * fname);

#endif /* asttoJS_h */
