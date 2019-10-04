//
//  json.c
//  server
//
//  Created by Дмитрий Маслюков on 20/09/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include <api.h>
#include <assert.h>
/*
 algoritm: split into symbols, then iterating over them bring the object that lies in root
 */
#define ob_alloc malloc
struct jsontoken{
    enum jstoktype{
        jsboollit,
        jsstrlit,
        jsnumlit,
        jscolon,
        jscomma,
        jsosbr,
        jscsbr,
        jsobrace,
        jscbrace
    } type;
    object * val;
};

struct json_parser_array{
    struct jsontoken * tokens;
    int token_c;
    int token_cap;
};

#define JS_TOK_ARR_SETUP { malloc(sizeof(struct jsontoken) * 15),0, 15}

void add_token(struct json_parser_array *arr, struct jsontoken *tok){
    if(arr->token_c++ == arr->token_cap){
        arr->tokens = realloc(arr->tokens, (arr->token_cap <<=1));
    }
    arr->tokens[arr->token_c - 1] = *tok;
}

#define is_numeric(sym) (isdigit(sym) || sym=='.')

struct json_parser_array str_to_tokens(dulstring * s){
    struct json_parser_array arr = JS_TOK_ARR_SETUP;
#warning TODO:flatten the string
    for(char * str_iter = s->content; str_iter != s->content + s->len; ++str_iter){
        //treat start as the real beginning, otherwise moving the ptr
        //the string literal cannot appear here - its already captured
        while(*str_iter == ' ')
            str_iter++;
        if(*str_iter == '"'){
            //parse strlit
            int depth = 1;
            char * str_begin = ++str_iter;
            while (*str_iter != '"' && str_iter != s->content + s->len)
                str_iter++;
            if(*str_iter!='"'){
                //error in format
            }
            struct jsontoken tok = {
                jsstrlit,
                strfromnchar(str_begin, str_iter - str_begin)
            };
            add_token(&arr, &tok);
            continue;
        }
        if(*str_iter ==','){
            struct jsontoken tok = {
                jscomma,
                0
            };
            add_token(&arr, &tok);
            continue;
        }
        if(*str_iter ==':'){
            struct jsontoken tok = {
                jscolon,
                0
            };
            add_token(&arr, &tok);
            continue;
        }
        if(*str_iter =='['){
            struct jsontoken tok = {
                jsosbr,
                0
            };
            add_token(&arr, &tok);
            continue;
        }
        if(*str_iter ==']'){
            struct jsontoken tok = {
                jscsbr,
                0
            };
            add_token(&arr, &tok);
            continue;
        }
        if(*str_iter =='{'){
            struct jsontoken tok = {
                jsobrace,
                0
            };
            add_token(&arr, &tok);
            continue;
        }
        if(*str_iter =='}'){
            struct jsontoken tok = {
                jscbrace,
                0
            };
            add_token(&arr, &tok);
            continue;
        }
        if(strncmp("true", str_iter, 4)==0){
            struct jsontoken tok = {
                jsboollit,
                boolfromlexem(1)
            };
            str_iter += 3;
            add_token(&arr, &tok);
            continue;
        }
        if(strncmp("false", str_iter, 5)==0){
            str_iter += 4;
            struct jsontoken tok = {
                jsboollit,
                boolfromlexem(0)
            };
            add_token(&arr, &tok);
            continue;
        }
        //otherwise it is a number
        double d;
        char * number_ending;
        d = strtod(str_iter, &number_ending);
        str_iter = number_ending;
        struct jsontoken tok = {
            jsnumlit,
            numfromdouble(d)
        };
        add_token(&arr, &tok);
    }
    return arr;
}

struct arrtok_iter {
    struct json_parser_array arr;
    int pos;
};

object * parse_something(struct arrtok_iter * i);

object * parse_object(struct arrtok_iter * i){
    object * o = new_ob();
    //eat {
    i->pos++;
    while(i->arr.tokens[i->pos].type != jscbrace){
        assert(i->arr.tokens[i->pos].type == jsstrlit);
        object * key = i->arr.tokens[i->pos].val;
        i->pos++;
        assert(i->arr.tokens[i->pos].type == jscolon);
        i->pos++;
        object * val = parse_something(i);
        ob_subscr_set(o, key, val);
        if(i->arr.tokens[i->pos].type == jscbrace){
            break;
        }
        assert(i->arr.tokens[i->pos].type == jscomma);
        i->pos++;
       
    }
    i->pos++;
    return o;
}

object * parse_literal(struct arrtok_iter * i){
    return i->arr.tokens[i->pos++].val;
}

object * parse_array(struct arrtok_iter * i){
    binarg Args = {0, 0};
    object * o = __bin_array(Args);
    //eat [
    i->pos++;
    while(i->arr.tokens[i->pos].type != jscsbr){
        object * val = parse_something(i);
        binarg A;
        A.aptr = &val;
        A.a_passed = 1;
        append(o, A);
        if(i->arr.tokens[i->pos].type == jscsbr){
            break;
        }
        assert(i->arr.tokens[i->pos].type == jscomma);
        i->pos++;
    }
    i->pos++;
    return o;
}

object * parse_something(struct arrtok_iter * i){
    switch (i->arr.tokens[i->pos].type) {
        case jsstrlit:
        case jsboollit:
        case jsnumlit:
            return parse_literal(i);
        case jsosbr:
            return parse_array(i);
        case jsobrace:
            return parse_object(i);
        default:
            return 0;
    }
}

BIN_DECL(parse_wrapper){
    dulstring * s = *Args.aptr;
    struct json_parser_array a = str_to_tokens(s);
    struct arrtok_iter i = {
        a,
        0
    };
    return parse_something(&i);
}
