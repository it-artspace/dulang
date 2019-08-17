//
//  builtin.c
//  dulang
//
//  Created by Дмитрий Маслюков on 18/07/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../api.h"



const struct obtype BINTYPE = {
    "builtin"
};




object* __bin_obdump    (binarg Args, struct _crt * coro){
    for(int i =0; i<Args.a_passed; ++i){
        object* curarg = Args.aptr[i];
        if(curarg){
            printf("object of type: %s at %lX, handles %d pointers\n",curarg->type->name, (unsigned long)curarg, curarg->refcnt);
            if(curarg->type->dump){
                char* repr = curarg->type->dump(curarg);
                printf("repr: %s\n", repr);
                free(repr);
            }
        } else {
            printf("nullptr");
        }
    }
    return 0;
}

object* __bin_typeof    (binarg Args, struct _crt * coro){
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


object* __bin_range(binarg Args, struct _crt* coro){
    switch(Args.a_passed){
        case 1:{
            object* o = Args.aptr[0];
            if(strcmp(o->type->name, "number")!=0){
                fprintf(stderr, "cannot make a range out of object of type %s", o->type->name);
                return 0;
            }
            rangeobject* r = (rangeobject*)malloc(sizeof(rangeobject));
            r->type = &RANGEOBJECTTYPE;
            r->refcnt = 1;
            r->start = 0;
            r->step = 1;
            r->end = ((dulnumber*)o)->val;
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
            rangeobject* r = (rangeobject*)malloc(sizeof(rangeobject));
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
    rangeobject* r = (rangeobject*)malloc(sizeof(rangeobject));
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
            free(r);
            return 0;
        }
        r->start = ((dulnumber*)a->items[0])->val;
        if(strcmp(a->items[1]->type->name, "number")!=0){
            fprintf(stderr, "Parameters of numeric type are expected but %s given\n",  a->items[1]->type->name);
            free(r);
            return 0;
        }
        r->end = ((dulnumber*)a->items[1])->val;
        if(a->count == 3){
            if(strcmp(a->items[2]->type->name, "number")!=0){
                fprintf(stderr, "Parameters of numeric type are expected but %s given\n",  a->items[2]->type->name);
                free(r);
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

object* __bin_object(binarg Args, struct _crt*coro){
    if(Args.a_passed == 0)
        return new_ob();
    if(Args.a_passed == 1 && strcmp(Args.aptr[0]->type->name, "functional object")==0){
        //initialized with lambda
        object* obj = new_ob();
        funcobject* r_func_arg = (funcobject*)Args.aptr[0];
        context* c = init_context(r_func_arg, coro);
        int this_pos = -1;
        for(int i = 0; i<r_func_arg->namecount; ++i){
            if(strcmp("this", r_func_arg->varnames[i]) == 0){
                this_pos = i;
                break;
            }
        }
        
        if(this_pos!=-1){
            c->vars[this_pos] = obj;
            c->this_ptr = obj;
        }
        return obj;
    } else {
        object* obj = new_ob();
        for(int i = 0; i<Args.a_passed; ++i){
            if(strcmp(Args.aptr[i]->type->name, "object")!=0){
                fprintf(stderr, "cannot inherit object from %s type", Args.aptr[i]->type->name);
                obj_dealloc(obj);
                return 0;
            }
            single_ob* o = (single_ob*)Args.aptr[i];
            for(int prop_index = 0; prop_index<256; ++prop_index){
                if(!o->content[prop_index].is_valid){
                    object* m = o->content[prop_index].member;
                    ob_subscr_set(obj, o->content[prop_index].name, m);
                }
            }
        }
        return obj;
    }
}


object* __bin_str       (binarg Args, struct _crt *_){
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

