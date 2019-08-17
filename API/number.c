//
//  number.c
//  dulang
//
//  Created by Дмитрий Маслюков on 16/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../api.h"

char num_lt(object*left, object*right){
    dulnumber*f = (dulnumber*)left;
    dulnumber*s = (dulnumber*)right;
    return f->val < s->val;
}

char num_eq(object* left, object*right){
    if(!right)
        return 0;
    if(strcmp(right->type->name, "number")!=0)
        return 0;
    return ((dulnumber*)left)->val == ((dulnumber*)right)->val;
}



const struct obtype NUMTYPE = {
    "number",
    &dumpnumber, //dump
    0, //alloc
    &num_dealloc, //dealloc
    &numplus, //+
    &numminus, //-
    &nummult, // *
    &numdiv, // /
    0, // +=
    0, // -=
    0, // *=
    0, // /=
    &num_lt, // <
    0, // >
    &num_eq, // ==
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

object* numfromdouble(double val){
    dulnumber* newnum = (dulnumber*)malloc(sizeof(dulnumber));
    newnum->refcnt = 1;
    newnum->val = val;
    newnum->type = &NUMTYPE;
    return (object*)newnum;
}

char* dumpnumber(object* num){
    char*nstr = (char*)malloc(100);
    sprintf(nstr, "%lf", ((dulnumber*)num)->val);
    return nstr;
}
void num_dealloc(object*o){}

object* numplus(object*left, object*right){
    if(strcmp(right->type->name, "number")!=0){
        fprintf(stderr, "invalid right operand type: %s, but number expected\n", right->type->name);
        return 0;
    }
    dulnumber* res = (dulnumber*)malloc(sizeof(dulnumber));
    res->type = &NUMTYPE;
    res->refcnt = 0;
    res->val = ((dulnumber*)left)->val + ((dulnumber*)right)->val;
    return (object*)res;
}

object* numminus(object*left, object*right){
    if(strcmp(right->type->name, "number")!=0){
        fprintf(stderr, "invalid right operand type: %s, but number expected\n", right->type->name);
        return 0;
    }
    dulnumber* res = (dulnumber*)malloc(sizeof(dulnumber));
    res->type = &NUMTYPE;
    res->refcnt = 0;
    res->val = ((dulnumber*)left)->val - ((dulnumber*)right)->val;
    return (object*)res;
}

object* nummult(object*left, object*right){
    if(strcmp(right->type->name, "number")!=0){
        fprintf(stderr, "invalid right operand type: %s, but number expected\n", right->type->name);
        return 0;
    }
    dulnumber* res = (dulnumber*)malloc(sizeof(dulnumber));
    res->type = &NUMTYPE;
    res->refcnt = 0;
    res->val = ((dulnumber*)left)->val * ((dulnumber*)right)->val;
    return (object*)res;
}

object* numdiv(object*left, object*right){
    if(strcmp(right->type->name, "number")!=0){
        fprintf(stderr, "invalid right operand type: %s, but number expected\n", right->type->name);
        return 0;
    }
    dulnumber* res = (dulnumber*)malloc(sizeof(dulnumber));
    res->type = &NUMTYPE;
    res->refcnt = 0;
    res->val = ((dulnumber*)left)->val / ((dulnumber*)right)->val;
    return (object*)res;
}
