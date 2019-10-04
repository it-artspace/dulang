//
//  obimpl.c
//  dulang
//
//  Created by Дмитрий Маслюков on 16/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../api.h"
#include <sys/mman.h>
#define align(size) ((size & 0xfffffffffffffff8) + 8)
#define BLOCKSIZE 4096
#define dulfree_ob free



void ob_dealloc(object*ob){
    if(ob->type->dealloc){
        ob->type->dealloc(ob);
    }
    if(ob->type->type_id == number_id || ob->type->type_id == string_id){
        dulfree_ob(ob);
    } else {
        free(ob);
    }
}

void* dulalloc(unsigned long size){
    void* ptr = malloc(size);
    return ptr;
}

void dulfree(void*ptr){
    free(ptr);
}


