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
#include <pthread.h>
#include <unistd.h>

static char * build_dir = "/Users/jernicozz/Documents/Niolang/";
//first place to lookup files with non-absolute path

static object* mods;

void init_mods(){
    mods = new_ob();
}

int cmd_count = 4;
const char * cmds [] = {
    "build", //for scripts
    "import", //for modules
    "launch", //for both source and byc - autodetect
    "compile"
};

void import_module(char*fname){
    if(!strstr(fname, "/")){
        //need to glue to build_dir
        char* fullname = malloc(strlen(build_dir) + strlen(fname) + 1);
        sprintf(fullname, "%s/%s", build_dir, fname);
        fname = fullname;
    } else {
        char* b = strdup(fname);
        build_dir = dirname(b);
    }
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
    
    char* modname = strdup(rdbuf);
    fprintf(output, "importing module %s...\n\n", rdbuf);
    fgets(rdbuf, 1024, f);
    strtok(rdbuf, "\n");
    void* lib = dlopen(rdbuf, RTLD_LAZY);
    if(!lib){
        fprintf(stderr, "cannot open library %s, aborting", rdbuf);
    }
    while(fscanf(f, "%s", rdbuf)==1){
        binfptr fp = dlsym(lib, rdbuf);
        if(!fp){
            fprintf(stderr, "cannot find %s function in module %s, aborting", rdbuf, modname);
            return;
        }
        
        builtin_func* to_enplace = (builtin_func*)dulalloc(sizeof(builtin_func));
        
        to_enplace->func_pointer = fp;
        to_enplace->type = &BINTYPE;
        to_enplace->refcnt = 1;
        to_enplace->name = strdup(rdbuf);
        ob_subscr_set((object*)obj, rdbuf, (object*)to_enplace);
    }
    ob_subscr_set(mods, modname, (object*)obj);
    
}

void launch_file(char*fname){
    if(access(fname, F_OK) ==-1){
        //need to glue to build_dir
        char* fullname = malloc(strlen(build_dir) + strlen(fname) + 1);
        sprintf(fullname, "%s/%s", build_dir, fname);
        fname = fullname;
    } else {
        char* b = strdup(fname);
        build_dir = dirname(b);
    }
    funcobject*f = load_file(fname);
#if print_bytecode
    char* dump = dumpfunc(f);
    fprintf(output, "%s", dump);
    free(dump);
#endif
    char* bname = strtok(basename(strdup(fname)), ".");
    struct _crt* newcoro = start_coro(current_thread, f);
    context* created = newcoro->sttop;
    object** vars = created->vars;
    current_thread->current = newcoro;
    fprintf(output, "launching module %s...\n\n", bname);
    pthread_mutex_lock(&workload_lock);
    pthread_cond_signal(&workload_cond);
    pthread_mutex_unlock(&workload_lock);
    
}

void compile_to_binary(char* fname){
    funcobject*f = 0;
    //its a module
    char* nameiter = basename(fname);
    nameiter = strtok(nameiter, ".");
    char* newname = (char*)dulalloc(strlen(nameiter)+6);
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
    return ob_subscr_get(mods, strfromchar(name));
}

funcobject * file_to_fo(char * fname){
    if(fname[0]!='/'){
        //need to glue to build_dir
        char* fullname = malloc(strlen(build_dir) + strlen(fname) + 1);
        sprintf(fullname, "%s/%s", build_dir, fname);
        fname = fullname;
    } else {
        char* b = strdup(fname);
        build_dir = dirname(b);
    }
    funcobject*f = load_file(fname);
    return f;
}
void add_module(char * name, object * mod){
    ob_subscr_set(mods, strfromchar(name), mod);
}

