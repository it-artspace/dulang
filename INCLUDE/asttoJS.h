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

typedef struct {
    char fname [30];
    int cur_indent;
    char * content;
    int clength;
    int ccap;
} jswriter;

jswriter * init_writer(char* modname);
void jswrite_node   (jswriter*, astnode*);
void jswrite_sym    (jswriter*, char*, int);
void jswrite_tofile (jswriter*);

#endif /* asttoJS_h */
