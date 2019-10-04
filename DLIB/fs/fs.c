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
#include <sys/stat.h>


BIN_DECL(read){
    dulstring * path = (dulstring*)*Args.aptr;
    path->content[path->len] = 0;
    FILE * f = fopen(path->content, "r");
    if(!f)
        return 0;
    char * chunk = malloc(4096);
    object * str_chunk = allocstr();
    free(((dulstring*)str_chunk)->content);
    ((dulstring*)str_chunk)->content = chunk;
    ((dulstring*)str_chunk)->len = 0;
    ((dulstring*)str_chunk)->cap = 4096;
    object * acc_string = allocstr();
    int all_read = 0;
    while(!feof(f)){
        int bytes_read = fread(chunk, 1, 4096, f);
        ((dulstring*)str_chunk)->len = bytes_read;
        acc_string = str_iadd(acc_string, str_chunk);
    }
    fclose(f);
    return acc_string;
}




BIN_DECL(dirTree){
    dulstring * arg = (dulstring*)*Args.aptr;
    arg->content[arg->len] = 0;
    DIR * dir = opendir(arg->content);
    struct dirent * entry;
    struct stat bufstat;
    object* name_ = strfromchar("name");
    object* isDir = strfromchar("isDir");
    while((entry = readdir(dir))){
        lstat(entry->d_name, &bufstat);
        object * ob = new_ob();
        ob_subscr_set(ob, name_, strfromchar(entry->d_name));
        if(S_ISDIR(bufstat.st_mode)){
            
        } else {
            
        }
    }
    closedir(dir);
    return 0;
}
