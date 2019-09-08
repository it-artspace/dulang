//
//  asttobyc.c
//  dulang
//
//  Created by Дмитрий Маслюков on 22/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//
#define NEW(TYPE) (TYPE*)malloc(sizeof(TYPE))
#include <sys/mman.h>
#include "../api.h"
#include "../INCLUDE/dulthread.h"
#include "../debuginfo.h"
#include <libgen.h>

int nametable_lookup( funcobject* writer, char* name ){
    for(int i = 0; i<writer->namecount; ++i){
        if(strcmp(writer->varnames[i], name)==0)
            return i;
    }
    return -1;
}
void add_literal(funcobject*writer, object*literal){
    if(writer->statcount ++ == writer->statcap){
        writer->statics = (object**)realloc(writer->statics, sizeof(object*)*(writer->statcap<<=1));
    }
    literal->refcnt=1;
    writer->statics[writer->statcount - 1] = literal;
}

void write_op(funcobject*self, int opcode, int arg){
    if(self->opcount++ == self->op_cap){
        self->byteops = realloc(self->byteops, sizeof(*self->byteops) * (self->op_cap<<=1));
    }
    self->byteops[self->opcount - 1].op_code = opcode;
    self->byteops[self->opcount - 1].arg = arg;
}

void add_name(funcobject* self, char* name){
    int found = 0;
    for(int i = 0; i<self->namecount; ++i){
        if(strcmp(name, self->varnames[i]) == 0){
            found = 1;
        }
    }
    if(!found){
        if(self->name_cap == self->namecount++){
            self->varnames = (char**)realloc(self->varnames,    sizeof(char*)*(self->name_cap<<=1));
        }
        self->varnames[self->namecount -1] = strdup(name);
    }
}


funcobject* init_func(const funcobject* parent){
    funcobject* new_func = NEW(funcobject);
    fsetup(new_func);
    new_func->argcount = 0;
    new_func->outer_scope = 0;
    new_func->name_cap = 10;
    new_func->varnames = (char**)malloc(sizeof(char*)*10);
    new_func->op_cap = 15;
    new_func->byteops = malloc(sizeof(*new_func->byteops)*15);
    new_func->statcap = 10;
    new_func->statcount = 0;
    new_func->statics = (object**)malloc(sizeof(object*)*10);
    new_func->opcount = 0;
    new_func->outer_scope = parent;
    new_func->outer_context = NULL;
    new_func->refcnt = 1;
    new_func->namecount = 0;
    return new_func;
}
funcobject* load_file(const char* fname){
    astnode* root = parse_file(fname);
    if(!root){
    	fprintf(stderr, "Error while parsing file");
    	return 0;
	}
#if print_ast
    astnode_print(root);
#endif
    funcobject* module = init_func(0);
    extract_names(module, root);
    if(root){
        for(int i = 0; i<root->children_count; ++i)
            write_node(module, root->children[i]);
    }
    write_op(module, pack_module, 0);
    astnode_delete(root);
    return module;
}

int find_name_recursively(funcobject*w, char*name);
void load_func_process_storenames( astnode* current, funcobject* currfunc, funcobject* outerfunc )
{
    if( current->type == NAME )
    {
        char* name = (char*) current->val;
        int found_val = find_name_recursively( outerfunc, name );
        int is_reserved = 0;
        for(int i = 0; i<bin_count; ++i){
            if(strcmp(bins[i]->name, name)==0){
                is_reserved = 1;
                break;
            }
        }
        int is_this = (strcmp(name, "this") == 0);
        if( found_val && !is_reserved && !is_this)
        {
            // Generate prologue for captured variables
            int  lookup_index = nametable_lookup( currfunc, name);
            if( lookup_index < 0 )
            {
                fprintf( stderr, "Error - name %s not found in function\n", name );
                printf( "\a" );
            }
            else {
                write_op( currfunc, load_outer, found_val );
                write_op( currfunc, store_name, lookup_index );
            }
        }
    }
    for( int i = 0; i < current->children_count; i ++ )
    {
        astnode* child = current->children[ i ];
        if( child && child->type != FUNCDEF )
            load_func_process_storenames( child, currfunc, outerfunc );
    }
}

void load_func(funcobject* writer, astnode*funroot){
    funcobject* new_writer = init_func(writer);
    extract_names(new_writer, funroot->children[0]);
    new_writer->argcount = new_writer->namecount;

    char* funcname = (char*) funroot->val;
    (void) funcname;
/*
    int is_ours = ( strcmp( funcname, "fib" ) == 0 );
    if( is_ours )
    {
        int z = 99;
        z *= 2;
        printf( "%d", z );
    }
*/
    extract_names(new_writer, funroot->children[1]);
    
    
    
    if( funroot->children_count > 1 )
    {
        astnode* statements;
        if( funroot->type == FUNCDEF )
            statements = funroot->children[ 1 ];
        else
            statements = funroot->children[ 0 ];
        load_func_process_storenames( statements, new_writer, writer );
    }
    
    add_literal(writer, (object*)new_writer);
    write_op(writer, funcdef, writer->statcount - 1);
    write_node(new_writer, funroot->children[1]);
    write_op(new_writer, push_null, 0);
    if(funroot->val!=0 && strcmp((char*)funroot->val, "lambda")!=0)
        write_op(writer, store_name, nametable_lookup(writer, (char*)funroot->val));
    
    
}

void extract_names(funcobject*writer, astnode*node){
    //to avoid scope conflicting when parse func need to call it explicitly for all children
    if(node->type == NAME){
        char* name = (char*)node->val;
        add_name(writer, name );
    }
    if(node->type == FUNCDEF){
        if(strcmp((char*)node->val, "lambda") != 0){
            add_name(writer, (char*)node->val);
        }
    } else {
        if(node->type == FORSTAT){
            char* iter_name;
            if(node->children[0]->children[0]->type == NAME){
                iter_name = (char*)malloc(strlen((char*)node->children[0]->children[0]->val)+6);
                strcpy(iter_name, (char*)node->children[0]->children[0]->val);
                strcpy(iter_name+ strlen((char*)node->children[0]->children[0]->val), "_iter$" );
            } else {
                iter_name = strdup ("_iter$");
            }
            
            add_name(writer, iter_name);
            //free(iter_name);
        }
        for(int i = 0; i<node->children_count; ++i){
            astnode* child = node->children[i];
            if( child == NULL ) continue;
            if( child->type != FUNCDEF )
                extract_names( writer, child );
            else
                if(strcmp((char*)child->val, "lambda") != 0){
                    add_name(writer, (char*)child->val);
                }
        }
    }
}




int find_name_recursively(funcobject*w, char*name){
    if(w == 0){
        return 0;
    }
    for(int i = 0; i<w->namecount; ++i){
        if(strcmp(w->varnames[i], name) == 0){
            return i+1;
        }
    }
    int val = find_name_recursively(w->outer_scope, name);
    if( val == 0 )
        return 0;
    return val + (1 << 16);
}

void write_if(funcobject* writer, astnode*ifnode){
    write_node(writer, ifnode->children[0]);
    write_op(writer, jump_if_not_true, 0);
    int pos_jne = writer->opcount -1 ;
    write_node(writer, ifnode->children[1]);
    writer->byteops[pos_jne].arg = writer->opcount - pos_jne - 1;
    if(ifnode->children_count == 3){
        write_op(writer, jump, 0);
        writer->byteops[pos_jne].arg ++;
        int pos_jump = writer->opcount -1 ;
        write_node(writer, ifnode->children[2]);
        int jump_offset = writer->opcount - pos_jump - 1;
        writer->byteops[pos_jump].arg = jump_offset;
    }
}


void write_for(funcobject*writer, astnode*node){
    write_node(writer, node->children[0]->children[1]);
    
    char* iter_name;
    if(node->children[0]->children[0]->type == NAME){
        char * name_wo_mangle = (char*)node->children[0]->children[0]->val;
        iter_name= (char*)malloc(strlen(name_wo_mangle)+6);
        strcpy(iter_name, name_wo_mangle);
        strcat(iter_name, "_iter$" );
    } else {
        iter_name = strdup("_iter$");
    }
    
    int iter_name_pos = nametable_lookup(writer, iter_name);
    write_op(writer, init_iter, iter_name_pos);
    

    int ret_pos = writer->opcount;
    write_op(writer, check_iter, 0);
    astnode* iter_synthetic = astnode_new(UNPACK_ITER, 0, 0);
    iter_synthetic->val = malloc(sizeof(int));
    *(int*)iter_synthetic->val = iter_name_pos;
    write_op(writer, unpack_iter, iter_name_pos);
    write_assign(writer,  node->children[0]->children[0]);
    write_node(writer, node->children[1]);
    write_op(writer, iter_next, iter_name_pos);
    write_op(writer, jump, ret_pos - writer->opcount - 1);
    writer->byteops[ret_pos].arg =writer->opcount - ret_pos - 1;
    //free(iter_name);
}



void write_assign(funcobject*writer, astnode*node){
    switch (node->type) {
        case NAME:
            write_op(writer, store_name, nametable_lookup(writer, (char*)node->val));
            break;
        case SUBSCR:
            write_node(writer, node->children[1]);
            write_node(writer, node->children[0]);
            write_op(writer, _subscr_set, 0);
            break;
            
        case MKTUPLE:
            do {
                write_op(writer, unpack_tuple, node->children_count);
                for(int i = 0; i<node->children_count;++i){
                    write_assign(writer, node->children[i]);
                }
                
            } while (0);
            break;
        default:
            fprintf(stderr, "expression %s cannot be on the left part of assign\n", "<>");
            break;
    }
}


void write_inplace(funcobject* writer, astnode*node, enum opcodes code){
    switch(node->children[0]->type){
        case SUBSCR:
            //here we need to explicitly check refcount and call set_subscr
            write_node(writer, node->children[1]);
            write_node(writer, node->children[0]->children[1]);
            write_node(writer, node->children[0]->children[0]);
            write_op(writer, inplace_subscr_op, code - op_inpl_add);
            break;
            
        default: break;
    }
}


void write_node(funcobject* writer, astnode*node){
    switch (node->type) {
        case IFSTAT:
            write_if(writer, node);
            break;
        case FORSTAT:
            write_for(writer, node);
            break;
        case ASSIGN:
            write_node(writer, node->children[1]);
            write_assign(writer, node->children[0]);
            break;
        case FUNCDEF:
            load_func(writer, node);
            break;
        case NAME:{
            int nameindex = nametable_lookup(writer, (char*)node->val);
            write_op(writer, load_name, nameindex);
        }   break;
        case COMPOUND:
            do{
                for(int i = 0; i<node->children_count; ++i)
                    write_node(writer, node->children[i]);
            }while(0);
            break;
        case FUNCCALL:
            //! принимать аргументом число - количество аргументов, которые надо взять со стека (сложно)
            if(node->children[1]->type == MKTUPLE){
                for(int i = 0; i<node->children[1]->children_count; ++i){
                    write_node(writer, node->children[1]->children[i]);
                }
            } else {
                write_node(writer, node->children[1]);
            }
            if(node->children[0]->type == SUBSCR){
                write_node(writer, node->children[0]->children[1]);
                write_node(writer, node->children[0]->children[0]);
                int argc = 1;
                if(node->children[1]->type == NULL_)
                    argc = 0;
                if(node->children[1]->type == MKTUPLE)
                    argc = node->children[1]->children_count;
                write_op(writer, invoke_method, argc);
            } else {
                //write_node(writer, node->children[1]);
                write_node(writer, node->children[0]);
                int arg_c = 1;
                if(node->children[1]->type == MKTUPLE)
                    arg_c = node->children[1]->children_count;
                if(node->children[1]->type == NULL_)
                    arg_c = 0;
                write_op(writer, invoke, arg_c);
            }
            
            
            break;
        case SUBSCR:
            write_node(writer, node->children[1]);
            write_node(writer, node->children[0]);
            write_op(writer, _subscr_get, 0);
            break;
        case DULRETURN:
            write_node(writer, node->children[0]);
            write_op(writer, dulreturn, 0);
            break;
        case NUMLIT:
            do{
                object* num = numfromdouble(*(double*)node->val);
                add_literal(writer, num);
                write_op(writer, load_static, writer->statcount - 1);
            }while(0);
            break;
        case BOOLLIT:
            do{
                object* b = boolfromlexem(*(char**)node->val);
                add_literal(writer, b);
                write_op(writer, load_static, writer->statcount - 1);
            }while(0);
            break;
        case STRLIT:
            do{
                object* str = strfromchar((char*)node->val);
                add_literal(writer, str);
                write_op(writer, load_static, writer->statcount - 1);
            }while(0);
            break;
        case UNPACK_ITER:
            do{
                write_op(writer, unpack_iter, *(int*)node->val);
            }while(0);
            break;
        case ASYNC:
            do{
                write_op(writer, doasync, 0);
                int pos = writer->opcount - 1;
                write_node(writer, node->children[0]);
                writer->byteops[pos].arg = writer->opcount - pos - 1;
            }while(0);
            break;
        case MKTUPLE:
            for(int i = 0; i<node->children_count; ++i){
                write_node(writer, node->children[i]);
            }
            write_op(writer, mktuple, node->children_count);
            break;
        case WRITE:{
            int argc = 1;
            if(node->children[0]->type == MKTUPLE){
                argc = node->children[0]->children_count;
                for(int i = 0; i<argc; ++i){
                    write_node(writer, node->children[0]->children[i]);
                }
            } else {
                 write_node(writer, node->children[0]);
            }
            write_op(writer, _write, argc);
        }break;
        case NULL_:
            write_op(writer, push_null, 1);
            break;
        case PLUS:{
            write_node(writer, node->children[0]);
            write_node(writer, node->children[1]);
            write_op(writer, op_plus, 0);
        } break;
        case MINUS:{
            write_node(writer, node->children[0]);
            write_node(writer, node->children[1]);
            write_op(writer, op_minus, 0);
        } break;
        case MULT:{
            write_node(writer, node->children[0]);
            write_node(writer, node->children[1]);
            write_op(writer, op_mult, 0);
        } break;
        case DIV:{
            write_node(writer, node->children[0]);
            write_node(writer, node->children[1]);
            write_op(writer, op_div, 0);
        } break;
        case IMPORT:{
            if(node->children[0]->type == STRLIT){
                write_node(writer, node->children[0]);
            } else {
                object * path = strfromchar((char*)node->children[0]->val);
                add_literal(writer, path);
                write_op(writer, load_static, writer->statcount - 1);
            }
            write_op(writer, import, 0);
            char* name = strdup((char*)node->children[0]->val);
            name = basename(name);
            name = strtok(name, ".");
            add_name(writer, name);
            write_op(writer, store_name, nametable_lookup(writer, name));
            //free(name);
        } break;
        case LESSTHAN:{
            write_node(writer, node->children[0]);
            write_node(writer, node->children[1]);
            write_op(writer, op_lt, 0);
        }break;
        case GREATERTHAN:{
            write_node(writer, node->children[0]);
            write_node(writer, node->children[1]);
            write_op(writer, op_gt, 0);
        }break;
        case LESSEQ:{
            write_node(writer, node->children[0]);
            write_node(writer, node->children[1]);
            write_op(writer, op_leq, 0);
        }break;
        case GREATEREQ:{
            write_node(writer, node->children[0]);
            write_node(writer, node->children[1]);
            write_op(writer, op_geq, 0);
        }break;
        case EQUAL:{
            write_node(writer, node->children[0]);
            write_node(writer, node->children[1]);
            write_op(writer, op_eq, 0);
        }break;
        case INOP:{
            write_node(writer, node->children[0]);
            write_node(writer, node->children[1]);
            write_op(writer, op_contains, 0);
        }break;
        case EXPR:{
            exprobject * o = new_exprobject();
            write_expression(o, writer, node->children[0]);
            add_literal(writer, (object*)o);
            write_op(writer, load_static, writer->statcount - 1);
            o->inlined_in = writer;
        }break;
        case WHILE:{
            int retpos = writer->opcount - 1;
            write_node(writer, node->children[0]);
            write_op(writer, jump_if_not_true, 0);
            int jump_to_pos = writer->opcount - 1;
            write_node(writer, node->children[1]);
            write_op(writer, jump, retpos - writer->opcount);
            writer->byteops[jump_to_pos].arg = writer->opcount - jump_to_pos;
        }break;
        case INPLADD:{
            //we think that child[0] is name
            
            write_node(writer, node->children[0]);
            write_node(writer, node->children[1]);
            int name_index = nametable_lookup(writer, (char*)node->children[0]->val);
            write_op(writer, op_inpl_add, name_index);
        }break;
        case OBJECT:{
            write_op(writer, push_object, 0);
            for(astnode** child = node->children[1]->children; child!=node->children[1]->children+node->children[1]->children_count; ++child){
                if((*child)->type != ASSIGN || (*child)->children[0]->type != NAME){
                    //crash
                    fprintf(stderr, "incorrect member declaration");
                    exit(0);
                }
                write_node(writer, (*child)->children[1]);
                write_node(writer, (*child)->children[0]);
                write_op(writer, _subscr_set, -1);
            }
            if(node->children[0]->val)
                write_op(writer, store_name, nametable_lookup(writer, node->children[0]->val));
        }break;
        default:
            break;
    }
}

void write_expression(exprobject*wr, funcobject*parent, astnode*node){
    int opstart = parent->opcount;
    write_node(parent, node);
    wr->ops = malloc(sizeof(struct op)*(parent->opcount - opstart));
    wr->bytecount = parent->opcount - opstart;
    memcpy(wr->ops, parent->byteops + opstart, sizeof(struct op)*(parent->opcount - opstart));
    parent->opcount = opstart;
    wr->return_to = parent->byteops + parent->opcount;
}
const struct obtype EXPRTYPE;

exprobject* new_exprobject(){
    exprobject * e = malloc(sizeof(exprobject));
    e->type = &EXPRTYPE;
    e->refcnt = 1;
    return e;
}
