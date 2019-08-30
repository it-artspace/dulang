//
//  bin_obj.c
//  NIolang
//
//  Created by Дмитрий Маслюков on 30/08/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../api.h"
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
            for(int prop_index = 0; prop_index<o->cap; ++prop_index){
                if(o->content[prop_index].name){
                    object* m = o->content[prop_index].member;
                    ob_subscr_set(obj, o->content[prop_index].name, m);
                }
            }
        }
        return obj;
    }
}
