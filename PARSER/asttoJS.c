//
//  asttoJS.c
//  NIolang
//
//  Created by Дмитрий Маслюков on 24/08/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../INCLUDE/asttoJS.h"

jswriter * init_writer(char * modname){
    jswriter * newwriter = malloc(sizeof(jswriter));
    strncpy(newwriter->fname, modname, 30);
    strncat(newwriter->fname, ".js", 30);
    newwriter->ccap = 4096;
    newwriter->content = malloc(4096);
    newwriter->clength = 0;
    newwriter->cur_indent = 0;
    return newwriter;
}
void jswrite_node   (jswriter*w, astnode*node){
    
    
}
