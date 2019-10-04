//
//  builtin.c
//  dulang
//
//  Created by Дмитрий Маслюков on 18/07/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../api.h"



const struct obtype BINTYPE = {
    "builtin",
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
    0, //next_iter
    0, // [0]
    0, // [0] =
    0, // tostr
    0, //copy
    0,  //unpack,
    bin_func_id//typeid
};






object* __bin_obdump    (binarg Args){
    for(int i =0; i<Args.a_passed; ++i){
        object* curarg = Args.aptr[i];
        if(curarg){
            printf("object of type: %s at %lX, handles %d pointers\n",curarg->type->name, (unsigned long)curarg, curarg->refcnt);
            if(curarg->type->dump){
                char* repr = curarg->type->dump(curarg);
                printf("repr: %s\n", repr);
                dulfree(repr);
            }
        } else {
            printf("nullptr");
        }
    }
    return 0;
}

object* __bin_typeof    (binarg Args){
    if(Args.a_passed > 1){
        object* res_arr [Args.a_passed];
        for(int i = Args.a_passed; i>0; --i){
            object* curarg = Args.aptr[i - 1];
            if(curarg)
                res_arr[i - 1] = strfromchar(curarg->type->name);
            else
                res_arr[i - 1] = strfromchar("null");
        }
        return _mktuple(res_arr + Args.a_passed, Args.a_passed);
    }
    if(*Args.aptr)
        return strfromchar((*Args.aptr)->type->name);
    else
        return strfromchar("null");
}


object* __bin_range(binarg Args){
    switch(Args.a_passed){
        case 1:{
            object* o = Args.aptr[0];
            if(strcmp(o->type->name, "number")!=0){
                fprintf(stderr, "cannot make a range out of object of type %s", o->type->name);
                return 0;
            }
            rangeobject* r = (rangeobject*)dulalloc(sizeof(rangeobject));
            r->type = &RANGEOBJECTTYPE;
            r->refcnt = 1;
            r->start = 0;
            r->step = 1;
            r->end = NumValOf(((dulnumber*)o));
            return (object*)r;
        } break;
        case 2:{
            object* o_start = Args.aptr[0];
            object* o_end = Args.aptr[1];
            if(strcmp(o_start->type->name, "number")!=0){
                fprintf(stderr, "cannot make a range out of object of type %s", o_start->type->name);
                return 0;
            }
            if(strcmp(o_end->type->name, "number")!=0){
                fprintf(stderr, "cannot make a range out of object of type %s", o_end->type->name);
                return 0;
            }
            rangeobject* r = (rangeobject*)dulalloc(sizeof(rangeobject));
            r->type = &RANGEOBJECTTYPE;
            r->refcnt = 1;
            r->start = ((dulnumber*)o_start)->val;
            r->step = 1;
            r->end = ((dulnumber*)o_end)->val;
            return (object*)r;
        } break;
        default:{
            fprintf(stderr, "range func takes 1-2 args but %d were given", Args.a_passed);
            return 0;
        }
    }
    
}

object* __bin_range_(object*args, struct _crt * coro){
    if(args == 0){
        fprintf(stderr, "cannot initialize range with no parameters. At least one needed\n");
        return 0;
    }
    rangeobject* r = (rangeobject*)dulalloc(sizeof(rangeobject));
    r->type = &RANGEOBJECTTYPE;
    r->refcnt = 1;
    if(strcmp(args->type->name, "bundle") == 0){
        bundle* a = (bundle*)args;
        
        if(a->count > 3){
            fprintf(stderr, "Too much parameters to initialize rangeobject. 1 - 3 needed\n");
            return 0;
        }
        if(strcmp(a->items[0]->type->name, "number")!=0){
            fprintf(stderr, "Parameters of numeric type are expected but %s given\n",  a->items[0]->type->name);
            dulfree(r);
            return 0;
        }
        r->start = ((dulnumber*)a->items[0])->val;
        if(strcmp(a->items[1]->type->name, "number")!=0){
            fprintf(stderr, "Parameters of numeric type are expected but %s given\n",  a->items[1]->type->name);
            dulfree(r);
            return 0;
        }
        r->end = ((dulnumber*)a->items[1])->val;
        if(a->count == 3){
            if(strcmp(a->items[2]->type->name, "number")!=0){
                fprintf(stderr, "Parameters of numeric type are expected but %s given\n",  a->items[2]->type->name);
                dulfree(r);
                return 0;
            }
            r->step = ((dulnumber*)a->items[2])->val;
            
        }
        else
            r->step = 1;
    }
    if(strcmp(args->type->name, "number") == 0){
        r->step = 1;
        r->start = 0;
        r->end = ((dulnumber*)args)->val;
    }
    
    return (object*)r;
}




object* __bin_str       (binarg Args){
    if(Args.a_passed != 1){
        fprintf(stderr, "in function str 1 argument expected but %d passed", Args.a_passed);
        return 0;
    }
    object* arg = *Args.aptr;
    if(!arg){
        return strfromchar("");
    }
    char* argdump = arg->type->dump(arg);
    object*s = strfromchar(argdump);
    free(argdump);
    return s;
}


object* __bin_time    (binarg Args){
    return numfromdouble((double)clock()/CLOCKS_PER_SEC);
}

object* __bin_array     (binarg Args){
    dularray * arr = malloc(sizeof(dularray));
    arr->refcnt = 0;
    arr->elem_count = 0;
    arr->cap = 15;
    arr->items = malloc(sizeof(object*)*15);
    arr->type = &ARRTYPE;
    if(Args.a_passed == 1 && (*Args.aptr)->type->init_iter){
        object * iter = (*Args.aptr)->type->init_iter(*Args.aptr);
        while(iter){
            binarg a;
            object * iter_val = iter->type->unpack_iter(iter);
            a.a_passed = 1;
            a.aptr = &iter_val;
            append((object*)arr, a);
            iter = iter->type->iter_next(iter);
        }
    } else {
        append((object*)arr, Args);
    }
    return (object*)arr;
}
