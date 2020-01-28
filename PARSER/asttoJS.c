//
//  asttoJS.c
//  NIolang
//
//  Created by Дмитрий Маслюков on 24/08/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../INCLUDE/asttoJS.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
jswriter * init_writer(char * modname){
    jswriter * newwriter = malloc(sizeof(jswriter));
    strncpy(newwriter->fname, modname, 300);
    strncat(newwriter->fname, ".js", 300);
    newwriter->ccap = 4096;
    newwriter->content = malloc(4096);
    newwriter->clength = 0;
    newwriter->cur_indent = 1;
    return newwriter;
}

void write_text(jswriter * writer, char * text){
    if( writer->ccap - writer->clength < strlen(text) ){
        writer->content = realloc(writer->content, writer->ccap + strlen(text) * 2);
    }
    strcpy(writer->content + writer->clength, text);
    writer->clength += strlen(text);
}




void add_to_arr(namearr * arr, char * name){
    if( arr->nc++ == arr->namecap ){
        arr->names = realloc(arr->names, (arr->namecap <<= 1));
    }
    arr->names[arr->nc - 1] = strdup(name);
}

namearr init_array(){
    namearr array;
    array.namecap = 15;
    array.nc = 0;
    array.names = malloc(sizeof(char*)*15);
    add_to_arr(&array, "object");
    add_to_arr(&array, "this");
    add_to_arr(&array, "id");
    add_to_arr(&array, "alert");
    return array;
}



static void write_indents(jswriter *w) {
    for(int i = 0; i < w->cur_indent; ++i)
        write_text(w, "    ");
}

/// Adding names to writer writing var decls
/// @param w the writer itself -- DFA that walks the tree and adds js code
/// @param node node to inspect -- called recusively
/// @param array  call with default array
void write_names(jswriter* w, astnode* node, namearr* array){
    if(node->type == NAME){
        int found = 0;
        for(int i = 0; i < array->nc; ++i){
            if(strcmp((char*)node->val, array->names[i]) == 0)
                found = 1;
        }
        if( ! found ){
            char buf [1000];
            write_indents(w);
            sprintf(buf, "let %s;\n", (char*)node->val);
            write_text(w, buf);
            add_to_arr(array, (char*)node->val);
        }
    }
    if(node->type != FUNCDEF)
        for(int i = 0; i < node->children_count; ++i){
            write_names(w, node->children[i], array);
        }
}

void jswrite_tofile(jswriter *w, char * fname){
    FILE * f = fopen(fname, "w");
    w->content[w->clength] = 0;
    fputs(w->content, f);
    fclose(f);
}

void jswrite_node   (jswriter*w, astnode*node){
    char sign [10];
    switch (node->type) {
        case ASSIGN:
            jswrite_node(w, node->children[0]);
            write_text(w, " = ");
            jswrite_node(w, node->children[1]);
            break;
        case PLUS:
        case MINUS:
        case MULT:
        case DIV:
            switch (node->type) {
                case PLUS:
                    sprintf(sign, " + ");
                    break;
                case MINUS:
                    sprintf(sign, " - ");
                    break;
                case MULT:
                    sprintf(sign, " * ");
                    break;
                case DIV:
                    sprintf(sign, " / ");
                    break;
                default:
                    break;
            }
            jswrite_node(w, node->children[0]);
            write_text(w, sign);
            jswrite_node(w, node->children[1]);
            break;
        case DULRETURN:
            write_text(w, "return ");
            jswrite_node(w, node->children[0]);
            break;
        case SUBSCR:
            jswrite_node(w, node->children[0]);
            write_text(w, "[");
            jswrite_node(w, node->children[1]);
            write_text(w, "]");
            break;
        case NAME:
            write_text(w, (char*)node->val);
            break;
        case MODULE:{
            write_text(w, "(function(){\n");
            namearr new_array = init_array();
            write_names(w, node, &new_array);
            for(int i = 0; i < node->children_count; ++i){
                write_indents(w);
                jswrite_node(w, node->children[i]);
                write_text(w, ";\n");
            }
            write_text(w, "});\n");
        }break;
        case FUNCCALL:{
            jswrite_node(w, node->children[0]);
            astnode * args = node->children[1];
            write_text(w, "(");
            if(args->type == MKTUPLE)
                for(int i = 0; i < args->children_count; ++i)
                    jswrite_node(w, args->children[i]);
            else
                jswrite_node(w, args);
            write_text(w, ")");
        }break;
        case NUMLIT:{
            char buf[100];
            double * d = (double*)node->val;
            sprintf(buf, "%lf", *d);
            write_text(w, buf);
        }break;
        case STRLIT:
            write_text(w, "\"");
            write_text(w, (char*)node->val);
            write_text(w, "\"");
            break;
        case FUNCDEF:{
            
            jswriter* func_writer = init_writer("");
            func_writer->cur_indent = w->cur_indent + 1;
            write_text(func_writer, "function(");
            astnode * funcargs = node->children[0];
            namearr argarr = init_array();
            if(funcargs->type == NAME){
                add_to_arr(&argarr, (char*)funcargs->val);
            } else {
                for(int i = 0; i < funcargs->children_count;++i)
                    add_to_arr(&argarr, (char*)funcargs->children[i]->val);
            }
            
            
            jswrite_node(func_writer, funcargs);
            write_text(func_writer, "){\n");
         
            write_names(func_writer, node->children[1], &argarr);
            jswrite_node(func_writer, node->children[1]);
            func_writer->cur_indent--;
            write_indents(func_writer);
            write_text(func_writer, "}");
            write_text(w, func_writer->content);
            
        }break;
        case COMPOUND:{
            for(int i = 0; i < node->children_count; ++i){
                write_indents(w);
                jswrite_node(w, node->children[i]);
                write_text(w, ";\n");
            }
        }break;
        default:
            break;
    }
    
}

object* __bin_tojs      (binarg Args, struct ctx*_){
    object * o = *Args.aptr;
    if( o->type->type_id != func_id ){
        if( o->type->type_id != method_id ){
            ctx_trshoot(_, "argument in tojs must be a function");
            return 0;
        }
        o = ((dulmethod*)o)->executable;
    }
    funcobject * to_transpile = (funcobject*)o;
    jswriter * new_writer = init_writer("");
    jswrite_node(new_writer, to_transpile->funcnode);
    return strfromchar(new_writer->content);
}
