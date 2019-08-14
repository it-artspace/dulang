
#include "../api.h"
#include "../debuginfo.h"
void print_lexem( lexem*l ) {
	char    buf[ 1024 ];
	char*	lexem_text = lexem_print_name( l, buf, 1024 );
	printf("%s", lexem_text );
}

/*void print_writer(byc_writer* W){
    printf("Printing description of Bytecode writer\n");
    printf("names:\n");
    for(int i = 0; i<W->name_count; ++i){
        printf("\t%s\n", W->funcnames[i]);
    }
    printf("statics:\n");
    for(int i = 0; i<W->stat_c; ++i){
        if(W->statics[i]->type!=0){
            char*dumped = W->statics[i]->type->dump(W->statics[i]);
            printf("\t%s\n", dumped);
            free(dumped);
        }
        
    }
    printf("ops and codes:\n");
    for(int i = 0; i<W->byc_c; ++i){
        print_op(W, i);
    }
}*/

funcobject* testparser(const char*fname){
    funcobject* module = load_file(fname);
#if print_bytecode
    char* dump =module->type->dump((object*)module);
    puts(dump);
    free(dump);
#endif
    return module;
}


