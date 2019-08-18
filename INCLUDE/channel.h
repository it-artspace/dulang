//
//  channel.h
//  NIolang
//
//  Created by Дмитрий Маслюков on 19/08/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#ifndef channel_h
#define channel_h
#include "typeInterface.h"

typedef struct {
    ObHead
    object ** first;
    object ** last;
    int capacity;
    object * receive_callback;
} dulchannel;

object* new_channel(void);

#endif /* channel_h */
