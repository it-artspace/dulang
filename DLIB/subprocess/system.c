//
//  system.c
//  server
//
//  Created by Дмитрий Маслюков on 06/09/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "system.h"



BIN_DECL(system){
    if((*Args.aptr)->type->id!=string_id){
        return 0;
    }
    dulstring * s = *Args.aptr;
    popen(s->content, "r+");
}
