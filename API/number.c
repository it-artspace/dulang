//
//  number.c
//  dulang
//
//  Created by Дмитрий Маслюков on 16/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../api.h"

#define ob_alloc malloc
#define dulfree_ob free


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

object * num_iadd(object * left, object * right){
    if(right->type->type_id != number_id){
        return 0;
    }
    dulnumber * l = (dulnumber*)left;
    dulnumber * r = (dulnumber*)right;
    if(l->refcnt > 1){
        
        dulnumber* ll = ob_alloc(sizeof(dulnumber));
        ll->type = &NUMTYPE;
        ll->refcnt = 0;
        ll->n_type = l->n_type;
        memcpy(&ll->val, &l->val, 8);
        l = ll;
    }
    if(l->n_type){
        l->i_val += NumValOf(r);
    } else {
        l->val += NumValOf(r);
    }
    return (object*)l;
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
    &num_iadd, // +=
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
    0, // tostr
    0, //copy
    0,  //unpack,
    number_id, //typeid
   
};

object* numfromdouble(double val){

    dulnumber* newnum = (dulnumber*)malloc(sizeof(dulnumber));

    newnum->refcnt = 0;
    newnum->val = val;
    newnum->n_type = 0;
    newnum->type = &NUMTYPE;
    return (object*)newnum;
}

object * numfromlong(long val){
    dulnumber* newnum = (dulnumber*)malloc(sizeof(dulnumber));
    
    newnum->refcnt = 0;
    newnum->i_val = val;
    newnum->n_type = 1;
    newnum->type = &NUMTYPE;
    return (object*)newnum;
}

char* dumpnumber(object* num){
    char*nstr = (char*)dulalloc(100);
    dulnumber * n = (dulnumber*)num;
    double d;
    double number = modf(NumValOf(n), &d);
    if(fabs(number) < 0.00001){
        sprintf(nstr, "%ld", (long)d);
    } else {
        sprintf(nstr, "%lf", ((dulnumber*)num)->val);
    }
    return nstr;
}
void num_dealloc(object*o){}

object* numplus(object*left, object*right){
    if(!right || right->type->type_id!=number_id){
        fprintf(stderr, "invalid right operand type: %s, but number expected\n", right->type->name);
        return 0;
    }
    dulnumber* res = (dulnumber*)ob_alloc(sizeof(dulnumber));
    res->type = &NUMTYPE;
    res->refcnt = 0;
    dulnumber * l = (dulnumber*)left;
    dulnumber * r = (dulnumber*)right;
    if(l->n_type && r->n_type){
        res->i_val = l->i_val + r->i_val;
        res->n_type = 1;
    } else {
        double v1 = NumValOf(l);
        double v2 = NumValOf(r);
        res->val = v1+v2;
        res->n_type = 0;
    }
    return (object*)res;
}

object* numminus(object*left, object*right){
    if(!right || right->type->type_id!=number_id){
        fprintf(stderr, "invalid right operand type: %s, but number expected\n", right->type->name);
        return 0;
    }
    dulnumber* res = (dulnumber*)ob_alloc(sizeof(dulnumber));
    res->type = &NUMTYPE;
    res->refcnt = 0;
    res->n_type = 0;
    res->val = ((dulnumber*)left)->val - ((dulnumber*)right)->val;
    return (object*)res;
}

object* nummult(object*left, object*right){
    if(strcmp(right->type->name, "number")!=0){
        fprintf(stderr, "invalid right operand type: %s, but number expected\n", right->type->name);
        return 0;
    }
    dulnumber* res = (dulnumber*)ob_alloc(sizeof(dulnumber));
    res->type = &NUMTYPE;
    res->refcnt = 0;
    dulnumber * l = (dulnumber *)left;
    dulnumber * r = (dulnumber *)right;
    res->n_type = l->n_type && r->n_type;
    if(res->n_type){
        res->i_val = NumValOf(l) * NumValOf(r);
    }else{
        res->val = NumValOf(l) * NumValOf(r);
    }
    
    return (object*)res;
}

object* numdiv(object*left, object*right){
    if(strcmp(right->type->name, "number")!=0){
        fprintf(stderr, "invalid right operand type: %s, but number expected\n", right->type->name);
        return 0;
    }
    dulnumber* res = (dulnumber*)ob_alloc(sizeof(dulnumber));
    res->type = &NUMTYPE;
    res->refcnt = 0;
    res->val = ((dulnumber*)left)->val / ((dulnumber*)right)->val;
    return (object*)res;
}
