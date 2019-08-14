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

void execute_command(char* cmd);
object* getmodule(char* name);

#endif /* buildscript_h */
