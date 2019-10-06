//
//  strimpl.c
//  dulang
//
//  Created by Дмитрий Маслюков on 02/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../api.h"
#include <math.h>
#define STRCAP 15
#define EXPERIMENTAL_CONS 1
object* str_len   (object* self, binarg Args){
    if(Args.a_passed > 0){
        fprintf(stderr, "expected 0 arguments in len method but %d passed", Args.a_passed);
        return 0;
    }
    return numfromdouble(((dulstring*)self)->len);
}


METHOD_DECL(strformat){
    dulstring * template = (dulstring*)self;
    bundle * args = (bundle*)_mktuple(Args.aptr + Args.a_passed, Args.a_passed);
    char * resbuf = malloc(50000);
    char * wr = resbuf;
    object * num_idx = numfromdouble(0);
    for(char * rdr = template->content; rdr < template->content + template->len; ++rdr){
        if(*rdr == '$'){
            rdr++;
            int i;
            char *numend;
            i = strtod(rdr, &numend);
            rdr = numend - 1;
            ((dulnumber*)num_idx)->val = i;
            object * o = tuple_sub_get((object*)args, num_idx);
            if(o->type->type_id == string_id){
                wr+= sprintf(wr, "%*s", ((dulstring*)o)->len, ((dulstring*)o)->content);
                continue;
            }
            if(o->type->type_id == func_id){
                
                continue;
            }
            if(o && o->type->dump){
                char * dump = o->type->dump(o);
                wr += sprintf(wr, "%s", dump);
                free(dump);
            }
        } else {
            *wr++ = *rdr;
        }
    }
    *wr = 0;
    return strfromchar(resbuf);
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
    },{
    "format",
    {
        &BINTYPE,
        1,
        &strformat
    }
}};
static int str_methods_count = 2;

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
    char former = self->content[(int)pos->val];
    self->content[(int)pos->val] = to_insert->content[0];
    //recount hash requires only recount of pos->val -th member
    //self->hash += (int)(to_insert->content[0] - former) * pow(POL, pos->val);
}

typedef struct {
    ObHead
    dulstring*coll;
    dulnumber * pos;
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
    new_iter->pos = numfromdouble(0);
    return (object*)new_iter;
}

object* str_iter_next   (object*s){
    striter* self = (striter*)s;
    self->pos->val++;
    if(self->pos->val >= self->coll->len){
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
    char * content = l->content;
    int llen = l->len;
    if(l->refcnt > 1){
        l =  allocstr();
        l->content = malloc(llen);
        l->len = llen;
        memcpy(l->content, content, llen);
    }
    if(l->cap < l->len + r->len){
        while(l->cap < l->len + r->len){
            l->cap <<= 1;
        }
        l->content = realloc(l->content, l->cap);
    }
    strncpy(l->content + l->len, r->content, r->len);
    l->len += r->len;
    l->hash += hashname_n(l->content, l->len);
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

void dump_cons(dulstring* cstring, char * where_to){
    if(!cstring->is_cons){
        memcpy(where_to, cstring->content, cstring->len);
    } else {
        int left_len = ((dulstring*)cstring->cons.left)->len;
        dump_cons(cstring->cons.left, where_to);
        dump_cons(cstring->cons.right, where_to + left_len);
    }
}


char* dumpstr(object*self){
    char*ptr = (char*)dulalloc(((dulstring*)self)->len+1);
    dulstring * s = (dulstring*)self;
    int byteno = ((dulstring*)self)->len;
    dump_cons(s, ptr);
    ptr[byteno] = 0;
    return ptr;
}


object* allocstr(void){
    dulstring*nstr = (dulstring*)dulalloc(sizeof(dulstring));
    nstr->type = &STRTYPE;
    nstr->len = 0;
    nstr->is_cons = 0;
    nstr->content = (char*)dulalloc(STRCAP);
    return (object*)nstr;
}

void destrstr(object*self){
    dulstring*s = (dulstring*)self;
    if(!s->is_cons)
        free(s->content);
    else{
        DECREF(s->cons.left);
        DECREF(s->cons.right);
    }
}

object*concatstr(object*left, object*right){
    if(right->type->type_id != string_id){
        fprintf(stderr, "cannot concat string with %s type\n", right->type->name);
        return 0;
    }
#if EXPERIMENTAL_CONS
    dulstring * res = malloc(sizeof(dulstring));
    INCREF(left);
    INCREF(right);
    res->refcnt = 0;
    res->is_cons = 1;
    res->type = &STRTYPE;
    res->cons.left = left;
    res->cons.right = right;
    res->len = ((dulstring*)left)->len + ((dulstring*)right)->len;
    return (object*)res;
#else
    
    dulstring*s_left = (dulstring*)left;
    dulstring*s_right = (dulstring*)right;
    dulstring*nstr = (dulstring*)dulalloc(sizeof(dulstring));
    nstr->type = &STRTYPE;
    nstr->refcnt = 0;
    nstr->len = s_left->len + s_right->len;
    nstr->content = (char*)dulalloc(nstr->len + 1);
    memcpy(nstr->content, s_left->content, s_left->len);
    memcpy(nstr->content+s_left->len, s_right->content, s_right->len);
    nstr->hash = hashname_n(nstr->content, nstr->len);
    nstr->content[nstr->len] = 0;
    return (object*)nstr;
#endif
}

int strleng(object*self){
    return ((dulstring*)self)->len;
}

object*strfromchar(char*source){
    dulstring*nst = (dulstring*)dulalloc(sizeof(dulstring));
    nst->type = &STRTYPE;
    nst->refcnt = 0;
    nst->is_cons = 0;
    nst->len = (int)strlen(source);
    nst->cap = nst->len;
    nst->content = strdup(source);
    nst->hash = hashstr(source);
    return (object*)nst;
}

object * strfromnchar(char * source, int len){
    dulstring*nst = (dulstring*)dulalloc(sizeof(dulstring));
    nst->type = &STRTYPE;
    nst->refcnt = 0;
    nst->is_cons = 0;
    nst->len = len;
    nst->cap = len;
    nst->content = strndup(source, len);
    nst->hash = hashname_n(source, len);
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


