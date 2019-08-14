//
//  buildscript.c
//  NIolang
//
//  Created by Дмитрий Маслюков on 30/07/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "buildscript.h"
#include "debuginfo.h"
#include "INCLUDE/dulthread.h"
#include <string.h>
#include "api.h"
#include <libgen.h>
#include <dlfcn.h>

static const char * build_dir = "/Users/jernicozz/Documents/Niolang/build";
//first place to lookup files with non-absolute path

static struct {
    struct mod{
        char name [20];
        object* modobj;
    } modules [100];
    int count;
} mods;


int cmd_count = 4;
const char * cmds [] = {
    "build", //for scripts
    "import", //for modules
    "launch", //for both source and byc - autodetect
    "compile"
};

void import_module(char*fname){
    
    single_ob* obj = (single_ob*)new_ob();
    
    FILE*f = fopen(fname, "r");
    if(!f){
        fprintf(stderr, "cannot open file %s, aborting", fname);
        return;
    }
    char rdbuf [1024];
    fgets(rdbuf, 1024, f);
    strtok(rdbuf, "\n");
    //we have read the name
    struct mod newmodule;
    strcpy(newmodule.name, rdbuf);
    fprintf(output, "importing module %s...\n\n", rdbuf);
    newmodule.modobj = (object*)obj;
    fgets(rdbuf, 1024, f);
    strtok(rdbuf, "\n");
    void* lib = dlopen(rdbuf, RTLD_LAZY);
    if(!lib){
        fprintf(stderr, "cannot open library %s, aborting", rdbuf);
    }
    while(fscanf(f, "%s", rdbuf)==1){
        binfptr fp = dlsym(lib, rdbuf);
        if(!fp){
            fprintf(stderr, "cannot find %s function in module %s, aborting", rdbuf, newmodule.name);
            return;
        }
        builtin_func* to_enplace = (builtin_func*)malloc(sizeof(builtin_func));
        to_enplace->func_pointer = fp;
        to_enplace->type = &BINTYPE;
        to_enplace->refcnt = 1;
        to_enplace->name = strdup(rdbuf);
        ob_subscr_set((object*)obj, rdbuf, (object*)to_enplace);
    }
    for(int i = 0; i<mods.count; ++i){
        if(strcmp(mods.modules[i].name, newmodule.name)==0){
            mods.modules[i].modobj = (object*)obj;
            return;
        }
    }
    mods.modules[mods.count++] = newmodule;
    
}

void launch_file(char*fname){
    object* obj = new_ob();
    funcobject*f = load_file(fname);
#if print_bytecode
    char* dump = dumpfunc(f);
    fprintf(output, "%s", dump);
    free(dump);
#endif
    char* bname = strtok(basename(fname), ".");
    struct _crt* newcoro = start_coro(current_thread, f);
    context* created = newcoro->sttop;
    object** vars = created->vars;
    fprintf(output, "launching module %s...\n\n", bname);
    while(exec_thread());
    for(int i = 0; i<f->namecount; ++i){
        ob_subscr_set(obj, f->varnames[i], vars[i]);
    }
    struct mod newmodule;
    newmodule.modobj = obj;
    strncpy(newmodule.name, bname, 20);
    for(int i = 0; i<mods.count; ++i){
        if(strcmp(mods.modules[i].name, newmodule.name)==0){
            mods.modules[i].modobj = (object*)obj;
            return;
        }
    }
    mods.modules[mods.count++] = newmodule;
    
}

void compile_to_binary(char* fname){
    funcobject*f = testparser(fname);
    //its a module
    char* nameiter = basename(fname);
    nameiter = strtok(nameiter, ".");
    char* newname = (char*)malloc(strlen(nameiter)+6);
    sprintf(newname, "%s.dulc", nameiter);
    FILE* mod_comp = fopen(newname, "w");
    char writer_buf [2048];
    long byc_hdr = 0xDC0DE;
    fwrite(&byc_hdr, sizeof(long), 1, mod_comp);
    fclose(mod_comp);
    
}




void execute_command(char* command){
    char* com = strtok(command, " ");
    if(strcmp(com, "build") == 0){
        char* arg = strtok(NULL, " \n");
        FILE*f = fopen(arg, "r");
        char cmdbuf_local [1024];
        while(fgets(cmdbuf_local, 1024, f)){
            execute_command(cmdbuf_local);
        }
        fclose(f);
    }
    if(strcmp(com, "import")==0){
        import_module(strtok(NULL, " \n"));
    }
    if(strcmp(com, "launch")==0){
        launch_file(strtok(NULL, " \n"));
    }
    
}


object* getmodule(char*name){
    for(int i = 0; i<mods.count; ++i){
        if(strcmp(mods.modules[i].name, name)==0){
            return mods.modules[i].modobj;
        }
    }
    return 0;
}
