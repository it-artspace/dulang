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

static char * build_dir = 0;
//first place to lookup files with non-absolute path

static object* mods;
static struct {
    const char * name;
    bin_method m;
} arr_methods [] = {{
    "length", {
        &BINTYPE,
        1,
        &length
    }}, {
        "append", {
            &BINTYPE,
            1,
            &append
        }}};
static int arr_mc = 2;
void init_arr_methods(){
    arrm = getmodule("__array");
    for(int i = 0; i<arr_mc; ++i){
        ob_subscr_set(arrm, (object*)strfromchar(arr_methods[i].name), (object*)&arr_methods[i].m);
    }
}



void init_mods(){
    
    //takes control over flow but it has to
    mods = new_ob();
    build_dir = malloc(1000);
    sprintf(build_dir, "%s/%s", getenv("HOME"), "/Dulang/NIolang");
    const char * modlist [] = {
        "__array.dul"
    };
    for(int i = 0; i <sizeof(modlist)/sizeof(const char *); ++i){
        funcobject * f = file_to_fo(modlist[i]);
        struct _crt * c = start_coro(work_pool, f);
        context * ctx = c->sttop;
        final_context = 1;
        while(work_pool->workload)
            exec_thread_(work_pool);
        final_context = 0;
        char * mname = strdup(modlist[i]);
        mname = strtok(mname, ".");
        object * mod_obj = new_ob();
        for(int i = 0; i<f->namecount; ++i)
            ob_subscr_set(mod_obj, strfromchar(f->varnames[i]), ctx->vars[i]);
        add_module(mname, mod_obj);
        
    }
    init_arr_methods();
}

int cmd_count = 4;
const char * cmds [] = {
    "build", //for scripts
    "import", //for modules
    "launch", //for both source and byc - autodetect
    "compile"
};

object* import_module(char*fname){
    if(fname[0]!='/'){
        //need to glue to build_dir
        char* fullname = malloc(strlen(build_dir) + strlen(fname) + 2);
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
        return 0;
    }
    char rdbuf [1024];
    fgets(rdbuf, 1024, f);
    strtok(rdbuf, "\n");
    //we have read the name
    
    char* modname = strdup(rdbuf);
    fprintf(output, "importing module %s...\n\n", rdbuf);
    fgets(rdbuf, 1024, f);
    strtok(rdbuf, "\n");
    if(*rdbuf != '/'){
        char * buf = strdup(rdbuf);
        sprintf(rdbuf, "%s%s/%s", getenv("HOME"), "/Dulang/NIolang", buf);
    }
    void* lib = dlopen(rdbuf, RTLD_LAZY);
    if(!lib){
        fprintf(stderr, "cannot open library %s, aborting", rdbuf);
    }
    while(fscanf(f, "%s", rdbuf)==1){
        binfptr fp = dlsym(lib, rdbuf);
        if(!fp){
            fprintf(stderr, "cannot find %s function in module %s, aborting", rdbuf, modname);
            return 0;
        }
        
        builtin_func* to_enplace = (builtin_func*)malloc(sizeof(builtin_func));
        
        to_enplace->func_pointer = fp;
        to_enplace->type = &BINTYPE;
        to_enplace->refcnt = 1;
        to_enplace->name = strdup(rdbuf);
        ob_subscr_set((object*)obj, strfromchar(rdbuf), (object*)to_enplace);
    }
    void (*initializer)(void) = dlsym(lib, "DulAPI_init_");
    if(initializer)
        initializer();
    ob_subscr_set(mods, strfromchar(modname), (object*)obj);
    fclose(f);
    return (object*)obj;
}

void launch_file(char*fname){
    if(fname[0]!='/'){
        //need to glue to build_dir
        char * dirname = malloc(1000);
        char * cwd= getcwd(dirname, 1000);
        char* fullname = malloc(strlen(cwd) + strlen(fname) + 2);
        sprintf(fullname, "%s/%s", cwd, fname);
        fname = fullname;
        
        
    } else {
        char* b = strdup(fname);
        build_dir = dirname(b);
    }
    char namebuf [100];
    sprintf(namebuf, "%s.js",fname);
    funcobject*f = load_file(fname);
    /*jswriter * writer = init_writer(namebuf);
    jswrite_node(writer, f->funcnode);
    jswrite_tofile(writer, namebuf);*/
#if print_bytecode
    char* dump = dumpfunc(f);
    fprintf(output, "%s", dump);
    free(dump);
#endif
    char* bname = strtok(basename(strdup(fname)), ".");
    struct _crt* newcoro = start_coro(current_thread, f);
    context* created = newcoro->sttop;
    created->non_destroy = 1;
    pthread_mutex_lock(&workload_lock);
    current_thread->current = newcoro;
    fprintf(output, "launching module %s...\n\n", bname);
    
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


__weak object* getmodule(char*name){
    return ob_subscr_get(mods, strfromchar(name));
}

funcobject * file_to_fo(char * fname){
    if(access(fname, F_OK)==-1){
        //need to glue to build_dir
        char* fullname = malloc(strlen(build_dir) + strlen(fname) + 2);
        sprintf(fullname, "%s/%s", build_dir, fname);
        fname = fullname;
    } else {
        char* b = strdup(fname);
        //build_dir = dirname(b);
    }
    char namebuf [100];
    sprintf(namebuf, "%s.js",fname);
    funcobject*f = load_file(fname);
    jswriter * writer = init_writer(namebuf);
    jswrite_node(writer, f->funcnode);
    jswrite_tofile(writer, namebuf);
    return f;
}
void add_module(char * name, object * mod){
    ob_subscr_set(mods, strfromchar(name), mod);
}

