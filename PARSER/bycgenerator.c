//
//  bycgenerator.c
//  NIolang
//
//  Created by Дмитрий Маслюков on 12/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "bycgenerator.h"
#include "../API/string.h"
#include "../API/number.h"
const char *opcode_repres []= {
    "load_outer",
    "load_static",
    "load_name",
    "store_name",
    //"store_outer",
    "_subscr_get",
    "_subscr_set",
    "jump",
    "jne",
    "init_iter",
    "iter_next",
    "stack_revert",
    "mktuple",
    "ioreturn"
};


int find_name_recursively(byc_writer*w, char*name){
    if(w == 0){
        return 0;
    }
    for(int i = 0; i<w->name_count; ++i){
        if(strcmp(w->funcnames[i], name) == 0){
            return i+1;
        }
    }
    return w->name_count*find_name_recursively(w->parent, name);
}

void print_op(byc_writer*w, int index){
    printf("\t%s : %d\n", opcode_repres[w->ops[index].opcode], w->ops[index].arg);
}
void write_op( byc_writer* w, int opcode, int arg ){
    if( w->byc_c ++ <= w->byc_cap ){
        w->byc_cap*= 2;
        w->ops = realloc( w->ops, w->byc_cap );
    }
    w->ops[ w->byc_c-1 ].arg = arg;
    w->ops[ w->byc_c-1 ].opcode = opcode;
}

funcobject* loadmodule( const char* fname ){
    astnode*root = parse_file(fname);
    return loadfunc(root);
}

void add_name_to_writer(byc_writer*writer, char*name){
    
    int found = 0;
    for(int i = 0; i<writer->name_count;++i){
        if(strcmp(writer->funcnames[i], name)==0){
            found = 1;
        }
    }
    if(!found){
        if(writer->name_count++ == writer->byc_cap){
            writer->funcnames = (char**)realloc(writer->funcnames, sizeof(char*)*(writer->name_cap<<=1));
            
        }
        writer->funcnames[writer->name_count-1] = strdup(name);
    }
}

int nametable_lookup( byc_writer* writer, char* name ){
    for(int i = 0; i<writer->name_count; ++i){
        if(strcmp(writer->funcnames[i], name)==0)
            return i;
    }
    return -1;
}

void extract_names(astnode*root, byc_writer*wr){
    if(root->type == NAME){
        add_name_to_writer(wr, (char*)root->val);
    }
    for(int i = 0; i<root->children_count; ++i){
        
        if(root->children[i]->type != FUNCDEF)
            extract_names(root->children[i], wr);
        else
            if(root->children[i]->type == FUNCDEF && (strcmp("lambda", (char*)root->children[i]->val)!=0)){
                add_name_to_writer(wr, (char*)root->children[i]->val);
            }
    }
}

void write_assign(byc_writer*wr, astnode*anode){
    
    astnode* lval = anode->children[0];
    switch (lval->type) {
        case NAME:
            do {
                write_node(wr, anode->children[1]);
                int globalidx = find_name_recursively(wr->parent, (char*)lval->val);
                if(globalidx==0){
                    //not found
                    int name_index = nametable_lookup(wr, (char*)lval->val);
                    write_op(wr, store_name, name_index);
                } else {
                    //outer cannot be stored!!
                    fprintf(stderr, "closure cant be stored");
                }
                
            } while(0);
            break;
        case MKTUPLE:
            do{
                for(int i = 0; i<lval->children_count;++i){
                    astnode*iter;
                    if(anode->children[1]->type != MKTUPLE){
                        astnode*indice = astnode_new(NUMLIT, 0, 0);
                        indice->val = malloc(sizeof(double));
                        *(double*)indice->val = i;
                        iter = astnode_new(ASSIGN, 2, 2, anode->children[0]->children[i], astnode_new(SUBSCR, 2, 2, anode->children[1], indice));
                    } else {
                        iter = astnode_new(ASSIGN, 2, 2, anode->children[0]->children[i], anode->children[1]->children[i]);
                    }
                    write_assign(wr, iter);
                    free(iter->children);
                    free(iter);
                }
            } while(0);
            break;
        case SUBSCR:
            do{
                write_node(wr, anode->children[1]);
                write_node(wr, anode->children[0]->children[1]);
                write_node(wr, anode->children[0]->children[0]);
                write_op(wr, _subscr_set, 0);
            } while(0);
        default:
            break;
    }
}

void write_node(byc_writer*w, astnode*node){
    switch (node->type) {
        case ASSIGN:
            write_assign(w, node);
            break;
        case NAME:
            do {
                int globalidx = find_name_recursively(w->parent, (char*)node->val);
                if(globalidx==0){
                    //not found in global scope
                    int name_index = nametable_lookup(w, (char*)node->val);
                    write_op(w, load_name, name_index);
                } else {
                    write_op(w, load_outer, globalidx);
                }
                
            } while(0);
            break;
        case STRLIT:
        case NUMLIT:
            do {
                object*newstatic;
                if(node->type == NUMLIT){
                    newstatic = numfromdouble(*(double*)node->val);
                } else {
                    newstatic = strfromchar((char*)node->val);
                }
                if(w->stat_c++ == w->stat_cap){
                    w->statics = (object**)realloc(w->statics, (w->stat_cap<<=1));
                }
                w->statics[w->stat_c-1] = newstatic;
                write_op(w, load_static, w->stat_c-1);
            } while(0);
            break;
        case FUNCDEF:
            do{
                if(w->stat_c++ == w->stat_cap){
                    w->statics = (object**)realloc(w->statics, (w->stat_cap<<=1));
                }
                byc_writer*newriter = init_bytecode_writer();
                newriter->parent = w;
                extract_names(node, newriter);
                write_node(newriter, node->children[1]);
                w->statics[w->stat_c-1] = (object*)loadfunc(newriter);
                if( strcmp((char*)node->val, "lambda") != 0 ){
                    write_op(w, load_static, w->stat_c-1);
                    int globalidx = find_name_recursively(w->parent, (char*)node->val);
                    if(globalidx==0){
                        //not found
                        int name_index = nametable_lookup(w, (char*)node->val);
                        write_op(w, store_name, name_index);
                    } else {
                        fprintf(stderr, "closure cant be stored");
                        
                    }
                    
                }
                write_op(w, load_static, w->stat_c-1);
            } while(0);
            break;
        case MODULE:
        case COMPOUND:
            do{
                for(int i = 0; i<node->children_count; ++i){
                    write_node(w, node->children[i]);
                }
            } while(0);
            break;
        case SUBSCR:
            do{
                write_node(w, node->children[1]);
                write_node(w, node->children[0]);
                write_op(w, _subscr_get, 0);
            } while(0);
            break;
        case IFSTAT:
            do{
                write_node(w, node->children[0]);
                int curpos = w->byc_c++;
                write_node(w, node->children[1]);
                w->ops[curpos].opcode = jne;
                w->ops[curpos].arg = w->byc_c-curpos-1;
                if(node->children_count == 3){
                    //contains else statement
                    int npos = w->byc_c++;
                    write_node(w, node->children[2]);
                    w->ops[npos].opcode = jump;
                    w->ops[npos].arg = w->byc_c-npos-1;
                    w->ops[curpos].arg+=1;
                }
            }while(0);
        case MKTUPLE:
            do{
                for(int i = 0; i<node->children_count; ++i){
                    write_node(w, node->children[i]);
                }
                write_op(w, mktuple, node->children_count);
            } while(0);
            
        case IORETURN:
            do{
                write_node(w, node->children[0]);
                write_op(w, ioreturn, -1);
            }while(0);
            break;
        default:
            break;
    }
}

byc_writer* init_bytecode_writer(void){
    byc_writer*w = (byc_writer*)malloc(sizeof(byc_writer));
    w->byc_c = 0;
    w->byc_cap = 100;
    w->ops = malloc(100*sizeof(*w->ops));
    w->stat_c = 0;
    w->stat_cap = 100;
    w->statics = (object**)malloc(100*sizeof(object*));
    w->name_count = 0;
    w->name_cap = 100;
    w->parent = 0;
    w->funcnames = (char**)malloc(100*sizeof(char*));
    return w;
}

funcobject* loadfunc(byc_writer*w){
    funcobject* nobj = (funcobject*)malloc(sizeof(funcobject)+w->byc_c*sizeof(*w->ops));
    fsetup(nobj);
    memcpy(nobj->byteops, w->ops, w->byc_c*sizeof(*w->ops));
    nobj->varnames = w->funcnames;
    nobj->statics = w->statics;
    nobj->licount = w->stat_c;
    nobj->varcount = w->name_count;
    nobj->opcount = w->byc_c;
    //TODO: args
    //TODO: writer finalize
    return nobj;
}
