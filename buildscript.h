//
//  buildscript.h
//  NIolang
//
//  Created by Дмитрий Маслюков on 30/07/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#ifndef buildscript_h
#define buildscript_h
#include "api.h"
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

void execute_command(char* cmd);
object* getmodule(char* name);
void add_module(char * name, object * mod);
void init_mods(void);
extern pthread_mutex_t workload_lock;
extern pthread_cond_t workload_cond;
void launch_file(char*fname);
funcobject * file_to_fo(char * fname);

//only for FFI
object* import_module(char*fname);
#endif /* buildscript_h */
