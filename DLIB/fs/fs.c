//
//  fs.c
//  server
//
//  Created by Дмитрий Маслюков on 02/10/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//


#include <api.h>
#include <dirent.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>

BIN_DECL(read);
BIN_DECL(write);


struct obtype FILETYPE = {
    .name = "File"
};

typedef struct {
    char * headers;
    void * data;
} dulcontainer;



BIN_DECL(read){
    dulstring * path = (dulstring*)*Args.aptr;
    path->content[path->len] = 0;
    int fd = open(path->content, O_RDONLY);
    if(fd<3)
        return 0;
    char * chunk = malloc(4096);
    object * str_chunk = allocstr();
    free(((dulstring*)str_chunk)->content);
    ((dulstring*)str_chunk)->content = chunk;
    ((dulstring*)str_chunk)->len = 0;
    ((dulstring*)str_chunk)->cap = 4096;
    object * acc_string = allocstr();
    int all_read = 0;
    //FILE * log = fopen("/Users/jernicozz/Documents/_Dulang/NIolang/log", "w");
    int bytes_read = 0;
    //fprintf(log, "start reading\n");
    struct stat bufstat;
    lstat(path->content, &bufstat);
    do{
        bytes_read = read(fd, chunk, 4096);
        if(bytes_read < 0)
            return 0;
        //FILE * log = fopen("/Users/jernicozz/Documents/_Dulang/NIolang/log", "w");
        //fprintf(log, "read %d bytes\n", bytes_read);
        ((dulstring*)str_chunk)->len = bytes_read;
        acc_string = str_iadd(acc_string, str_chunk);
        all_read += bytes_read;
    } while(all_read < bufstat.st_size);
    close(fd);
    return acc_string;
}


object * read_dirNode(const char * path){
    struct stat bufstat;
    object * node_object = new_ob();
    char namebuf [100];
    strcpy(namebuf, path);
    char * name = strrchr(namebuf, '/') + 1;
    if(name == 1)
        name = namebuf;
    ob_subscr_set(node_object, strfromchar("name"), strfromchar(name));
    lstat(path, &bufstat);
    ob_subscr_set(node_object, strfromchar("isDir"), boolfromlexem((char*)S_ISDIR(bufstat.st_mode)));
    binarg Args = {0, 0};
    object * arr = __bin_array(Args);
    //set for all case for monomorphism
    ob_subscr_set(node_object, strfromchar("children"), arr);
    if(S_ISDIR(bufstat.st_mode)){
        DIR * d = opendir(path);
        struct dirent * entry;
        while((entry = readdir(d))){
            Args.a_passed = 1;
            if(strcmp(entry->d_name, ".")!=0 && strcmp(entry->d_name, "..")!=0){
                object * aptr = read_dirNode(entry->d_name);
                Args.aptr = &aptr;
                append(arr, Args, 0);
            }
            
        }
        closedir(d);
    }
    return node_object;
}

BIN_DECL(dirTree){
    init_shapes();
    dulstring * arg = (dulstring*)*Args.aptr;
    arg->content[arg->len] = 0;
    return read_dirNode(arg->content);
}

BIN_DECL(write){
    if((*Args.aptr)->type->type_id != string_id){
        fprintf(stderr, "parameter of type string expected in fs.write");
        return 0;
    }
    dulstring * fname = (dulstring*)*Args.aptr;
    int fd = open(fname->content, O_WRONLY);
    return 0;
}


BIN_DECL(system){
    if(Args.a_passed < 1){
        //ctx_trshoot(ctx, "Not enough args passed to system");
    }
    dulstring * arg = *Args.aptr;
    
}
