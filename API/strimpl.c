//
//  strimpl.c
//  dulang
//
//  Created by Дмитрий Маслюков on 02/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../api.h"
#define STRCAP 15

object* str_len   (object* self, binarg Args){
    if(Args.a_passed > 0){
        fprintf(stderr, "expected 0 arguments in len method but %d passed", Args.a_passed);
        return 0;
    }
    return numfromdouble(((dulstring*)self)->len);
}


static struct {
    const char* name;
    bin_method m;
} string_methods [] = {{
    "length",
    {
        &BINTYPE,
        1,
        &str_len
    }
}};
static int str_methods_count = 1;

object* get_str_methods(void){
    static object * methods;
    if(methods == 0){
        methods = new_ob();
        for(int i = 0; i<str_methods_count; ++i){
            ob_subscr_set(methods, strfromchar(string_methods[i].name), (object*)&string_methods[i].m);
        }
    }
    return methods;
}


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

object* str_subscr_get(object* s, object * i){
    //s is guaranteed to be string
    dulstring* self = (dulstring*)s;
    if(i->type->type_id != number_id)
        return 0;
    dulnumber*pos = (dulnumber*)i;
    if(pos->val<0)
        pos->val+= self->len;
    if(pos->val < 0 || pos->val > self->len){
        return 0;
    }
    char* newsrc = strndup(self->content+(int)pos->val, 1);
    dulstring* newstr = (dulstring*)strfromchar(newsrc);
    free(newsrc);
    return (object*)newstr;
}

void str_subscr_set(object*s, object*i, object*c){
    if(c->type->type_id != string_id || i->type->type_id != number_id){
#warning TODO: exception
        return;
    }
    dulnumber * pos = (dulnumber*)i;
    dulstring* to_insert = (dulstring*)c;
    if(to_insert->len != 1){
        //dafuq?
        return;
    }
    dulstring*self = (dulstring*)s;
    if(pos->val < 0)
        i+=self->len;
    if(pos->val < 0 || pos->val > self->len){
        return;
    }
    self->content[(int)pos->val] = to_insert->content[0];
}

typedef struct {
    ObHead
    dulstring*coll;
    int pos;
} striter;
object* str_iter_next   (object*);
object* unpack_str_iter (object*);
const struct obtype STRITERTYPE = {
    "string iterator",
    0, //dump
    0, //alloc
    0, //dealloc
    0, //+
    0, //-
    0, // *
    0, // /
    0, // +=
    0, // -=
    0, // *=
    0, // /=
    0, // <
    0, // >
    0, // ==
    0, // <=
    0, // >=
    0, // f()
    0, // a in b
    0, //init_iter (collection initializes iter)
    &str_iter_next, //next_iter
    0, // [""]
    0, // [""] =
    0, // tostr
    0, //copy
    &unpack_str_iter,  //unpack,
    string_id, //typeid
    
};

object* init_str_iter(const object*s){
    dulstring*self = (dulstring*)s;
    striter* new_iter = dulalloc(sizeof(striter));
    new_iter->type = &STRITERTYPE;
    new_iter->refcnt = 1;
    new_iter->coll = self;
    new_iter->pos = 0;
    return (object*)new_iter;
}

object* str_iter_next   (object*s){
    striter* self = (striter*)s;
    self->pos++;
    if(self->pos >= self->coll->len){
        free(self);
        return 0;
    }
    
    return (object*)self;
}

object* unpack_str_iter (object*i){
    striter*self = (striter*)i;
    return str_subscr_get((object*)self->coll, self->pos);
}

object * str_iadd(object * left, object * right){
    if(right->type->type_id != string_id){
        return 0;
    }
    dulstring * l = (dulstring*)left;
    dulstring * r = (dulstring*)right;
    if(l->refcnt > 1){
        char* v = l->content;
        l =  strfromchar(v);
    }
    l->content = realloc(l->content, l->len + r->len);
    strncpy(l->content + l->len, r->content, r->len);
    l->len += r->len;
    return (object*)l;
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
    &str_iadd, // +=
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
    &init_str_iter, //init_iter (collection initializes iter)
    0, //next_iter
    &str_subscr_get, // [0]
    &str_subscr_set, // [0] =
    0, // tostr
    0, //copy
    0,  //unpack,
    string_id, //typeid
    &get_str_methods// method
};

char* dumpstr(object*self){
    char*ptr = (char*)dulalloc(((dulstring*)self)->len+12);
    sprintf(ptr, "\"%*s\"",((dulstring*)self)->len ,((dulstring*)self)->content);
    return ptr;
}


object* allocstr(void){
    dulstring*nstr = (dulstring*)dulalloc(sizeof(dulstring));
    nstr->type = &STRTYPE;
    nstr->len = 0;
    nstr->content = (char*)dulalloc(STRCAP);
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
    dulstring*nstr = (dulstring*)dulalloc(sizeof(dulstring));
    nstr->type = &STRTYPE;
    nstr->refcnt = 0;
    nstr->len = s_left->len + s_right->len;
    nstr->content = (char*)dulalloc(nstr->len + 1);
    memcpy(nstr->content, s_left->content, s_left->len);
    memcpy(nstr->content+s_left->len, s_right->content, s_right->len);
    nstr->content[nstr->len] = 0;
    return (object*)nstr;
}

int strleng(object*self){
    return ((dulstring*)self)->len;
}

object*strfromchar(char*source){
    dulstring*nst = (dulstring*)dulalloc(sizeof(dulstring));
    nst->type = &STRTYPE;
    nst->refcnt = 0;
    nst->len = (int)strlen(source);
    nst->content = strdup(source);
    return (object*)nst;
}

object* getSubstring(object*str, int posstart, int posend){
    //not null terminated
    //here typeof getSbustring is guaranteed
    dulstring*nst = (dulstring*)dulalloc(sizeof(dulstring));
    nst->type = &STRTYPE;
    nst->refcnt = str->refcnt++;
    nst->len =posend - posstart;
    nst->content = ((dulstring*)str)->content + posstart;
    return (object*)nst;
}


