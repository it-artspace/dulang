//
//  Dulalloc.c
//  NIolang
//
//  Created by Дмитрий Маслюков on 21/09/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../api.h"
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

typedef struct _mb{
    //used to do munmap
    void * ptr;
    void * current;
    struct _mb * prev;
    struct _mb * next;
    unsigned long space_left;
    unsigned int alloc_num;
} memblock;

static memblock * begin = 0;
static memblock * current = 0;


memblock * new_block(){
    memblock * nb = malloc(sizeof(memblock));
    nb->alloc_num = 0;
    nb->space_left = BLOCKSIZE;
    nb->next = 0;
    nb->prev = 0;
    nb->current = mmap(NULL, BLOCKSIZE, PROT_READ | PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
    nb->ptr = nb->current;
    return nb;
}



void setup_aa(){
    begin = new_block();
    current = begin;
}



void   dulfree_ob(void*ptr){
    memblock * belongs_to = *((memblock**)ptr - 1);
    belongs_to->alloc_num --;
    if(!belongs_to->alloc_num && belongs_to->space_left < 64){
        //free
        munmap(belongs_to->ptr, BLOCKSIZE);
        memblock * prev = belongs_to->prev;
        memblock * next = belongs_to->next;
        if(prev)
            prev->next = next;
        if(next)
            next->prev = prev;
        if(belongs_to == current){
            current = new_block();
            current->prev = prev;
            current->next = next;
        }
        free(belongs_to);
        
    }
}
void*   ob_alloc(unsigned long size){
    
    if(size > current->space_left){
        memblock * new_a = new_block();
        current->next = new_a;
        new_a->prev = current;
        current = new_a;
    }
    size += sizeof(struct AA**);
    // layout of ptr be like |--struct AA*--|--*ptr--|
    memblock** aptr = current->current;
    *(memblock**)current->current = current;
    current->current += size;
    current->space_left -= size;
    current->alloc_num ++;
    return aptr + 1;
}

