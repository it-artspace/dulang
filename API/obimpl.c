//
//  obimpl.c
//  dulang
//
//  Created by Дмитрий Маслюков on 16/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//


#include "../api.h"
void ob_dealloc(object*ob){
    ob->type->dealloc(ob);
    free(ob);
}
