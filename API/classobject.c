//
//  classobject.c
//  dulang
//
//  Created by Дмитрий Маслюков on 12/06/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../api.h"
object* get_attr(object*t, const char*key){
    classob* table = (classob*)t;
    unsigned int index = hashstr(key) % table->cap;
    while(strcmp(key, table->table[index].key) != 0){
        if(table->table[index].mark == DXEMPTY)
            return 0;
        index = (index*5 +1) % table->cap;
    }
    return table->table[index].val;
}

void set_attr(object*t, const char*key, object*val){
    classob* table = (classob*)t;
    unsigned int index = hashstr(key) % table->cap;
    
    
    do{
        if(table->table[index].mark == DXEMPTY){
            //can be inserted here
            break;
        }

        index = (index*5 +1) % table->cap;
    }while(strcmp(key, table->table[index].key) != 0);
    table->table[index].val = val;
    table->table[index].mark = DXUSED;
    strcpy(table->table[index].key, key);
}


object* new_classob(void){
    classob* new_object = (classob*)dulalloc(sizeof(classob) + 256*32);

    for(int i = 0; i<256; ++i){
        new_object->table[i].mark = DXEMPTY;
    }
    new_object->cap = 256;
    new_object->elemc = 0;
   
    return (object*)new_object;
}
