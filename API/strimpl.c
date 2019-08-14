//
//  strimpl.c
//  dulang
//
//  Created by Дмитрий Маслюков on 02/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../api.h"
#define STRCAP 15

object* getsubstr_method_wrapper(object*self, object*Args){
    if(strcmp(Args->type->name, "tuple") == 0){
        
    }
    if(strcmp(Args->type->name, "number") == 0){
        
        return getSubstring(self, ((dulnumber*)Args)->val, ((dulstring*)self)->len);
    }
    fprintf(stderr, "wrong argument types for string method substring\n");
    return 0;
}


char eq_str(object*left, object*right){
    if(!right)
        return 0;
    if(strcmp(right->type->name, "string") == 0){
        dulstring* _l = (dulstring*)left;
        dulstring* _r = (dulstring*)right;
        if(_r->len != _l->len)
            return 0;
        return strncmp(_l->content, _r->content, _r->len) == 0;
    } else {
        fprintf(stderr, "type issue: comparing string to not string\n");
        return 0;
    }
}




const struct obtype STRTYPE = {
    "string",
    &dumpstr, //dump
    0, //alloc
    &destrstr, //dealloc
    &concatstr, //+
    0, //-
    0, // *
    0, // /
    0, // +=
    0, // -=
    0, // *=
    0, // /=
    0, // <
    0, // >
    &eq_str, // ==
    0, // <=
    0, // >=
    0, // f()
    0, // a in b
    0, //init_iter (collection initializes iter)
    0, //next_iter
    0, // [0]
    0, // [0] =
    0, // [""]
    0, // [""] =
    0, // tostr
    0, //copy
    0,  //unpack,
    0, //invoke (deprecated)
    number_id, //typeid
    1, // methodnum
    0//methodarray
};

char* dumpstr(object*self){
    char*ptr = (char*)malloc(((dulstring*)self)->len+12);
    sprintf(ptr, "\"%*s\"",((dulstring*)self)->len ,((dulstring*)self)->content);
    return ptr;
}


object* allocstr(void){
    dulstring*nstr = (dulstring*)malloc(sizeof(dulstring));
    nstr->type = &STRTYPE;
    nstr->len = 0;
    nstr->content = (char*)malloc(STRCAP);
    return (object*)nstr;
}

void destrstr(object*self){
    dulstring*s = (dulstring*)self;
    free(s->content);
}

object*concatstr(object*left, object*right){
    if(strcmp(right->type->name, "string")!=0){
        fprintf(stderr, "cannot concat string with %s type\n", right->type->name);
        return 0;
    }
    dulstring*s_left = (dulstring*)left;
    dulstring*s_right = (dulstring*)right;
    dulstring*nstr = (dulstring*)malloc(sizeof(dulstring));
    nstr->type = &STRTYPE;
    nstr->refcnt = 0;
    nstr->len = s_left->len + s_right->len;
    nstr->content = (char*)malloc(nstr->len + 1);
    memcpy(nstr->content, s_left->content, s_left->len);
    memcpy(nstr->content+s_left->len, s_right->content, s_right->len);
    nstr->content[nstr->len] = 0;
    return (object*)nstr;
}

int strleng(object*self){
    return ((dulstring*)self)->len;
}

object*strfromchar(char*source){
    dulstring*nst = (dulstring*)malloc(sizeof(dulstring));
    nst->type = &STRTYPE;
    nst->refcnt = 0;
    nst->len = (int)strlen(source);
    nst->content = strdup(source);
    return (object*)nst;
}

object* getSubstring(object*str, int posstart, int posend){
    //not null terminated
    //here typeof getSbustring is guaranteed
    dulstring*nst = (dulstring*)malloc(sizeof(dulstring));
    nst->type = &STRTYPE;
    nst->refcnt = str->refcnt++;
    nst->len =posend - posstart;
    nst->content = ((dulstring*)str)->content + posstart;
    return (object*)nst;
}
