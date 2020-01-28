//
//  ipc.c
//  NIolang
//
//  Created by Дмитрий Маслюков on 28.01.2020.
//  Copyright © 2020 Дмитрий Маслюков. All rights reserved.
//

#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include "api.h"
#include<sys/socket.h>
#include <netinet/in.h> /* struct sockaddr_in, struct sockaddr */
#include <netdb.h> /* struct hostent, gethostbyname */

#include "../../INCLUDE/dulthread.h"

typedef struct {
    ObHead
    int writefd;
    int readfd;
    dulstring * rdbuf;
    dulstring * wrbuf;
    //may be same perhaps
} dulipchannel;

void DulAPI_init_(void){
    init_shapes();
}

void destroy_ipchannel(object*chan){
    dulipchannel* c = (dulipchannel*)chan;
    close(c->readfd);
    close(c->writefd);
}

METHOD_DECL(chwait){
    char rdbuf[4096];
    dulipchannel* chan = (dulipchannel*)self;
    int r = 1;
    //DECREF(chan->rdbuf);
    chan->rdbuf = allocstr();
    while(r){
        r = read(chan->readfd, rdbuf, 4096);
        rdbuf[r] = 0;
        dulstring * new_str = strfromchar(rdbuf);
        str_iadd(chan->rdbuf, new_str);
    }
    return chan->rdbuf;
}

METHOD_DECL(chwrite){
    if(Args.a_passed != 1 || (*Args.aptr)->type->type_id != string_id){
        char errmsg [1000];
        sprintf(errmsg, "in write method of ipchannel %d args passed but 1 expected of type string\n", Args.a_passed);
        //ctx_trshoot(ctx, errmsg);
        return 0;
    }
    dulipchannel * chan = (dulipchannel*)self;
    dulstring * s = *Args.aptr;
    int wrpos;
    while(wrpos < s->len){
        write(chan->writefd, s->content + wrpos, s->len - wrpos);
    }
}




static struct {
    const char * name;
    bin_method m;
} ch_methods [] = {
    { "wait",
        {&BINTYPE, 1, chwait}
    },
    {"push",
        {&BINTYPE, 1, chwrite}
    }
};

static int ch_methods_count = sizeof(ch_methods)/sizeof(*ch_methods);

object * get_ipc_methods(void){
    static object * methods = 0;
    if (!methods){
        methods = new_ob();
        for(int i = 0; i < ch_methods_count; ++i){
            ob_subscr_set(methods, strfromchar(ch_methods[i].name), (object*)&ch_methods[i].m);
        }
    }
    return methods;
}


struct obtype ipchannel = {
    "ipchannel",
    0, //dump
    0, //alloc
    0, //dealloc
    0, //+
    0, //-
    0, // *
    0, // /
    0, // +=
    0, // -=
    0, // *=
    0, // /=
    0, // <
    0, // >
    0, // ==
    0, // <=
    0, // >=
    0, // f()
    0, // a in b
    0, //init_iter (collection initializes iter)
    0, //next_iter
    0, // [0]
    0, // [0] =
    0, // tostr
    0, //copy
    0,  //unpack,
    -1, //typeid
    get_ipc_methods// method
};

BIN_DECL(popen){
    dulstring * arg = (dulstring*)*Args.aptr;
    dulipchannel * chan = malloc(sizeof(dulipchannel));
    arg->content[arg->len] = 0;
    int wrpipe[2];
    int rdpipe[2];
    pipe(wrpipe);
    pipe(rdpipe);
    int pid = fork();
    if(pid == 0){
        dup2(wrpipe[0], STDIN_FILENO);
        dup2(rdpipe[1], STDOUT_FILENO);
        char * argv [100];
        char * res = arg->content;
        char * tok = strtok(res, " ");
        char * prog = tok;
        int ind = 0;
        while(tok){
            tok = strtok(0, " ");
            argv[ind++] = tok;
        }
        argv[ind] = 0;
        execv(prog, argv);
        exit(1);
    } else {
        close(wrpipe[0]);
        close(rdpipe[1]);
    }
    
    
    chan->type = &ipchannel;
    chan->refcnt = 0;
    chan->readfd = rdpipe[0];
    chan->writefd = wrpipe[1];
    return chan;
}

BIN_DECL(connect){
#warning: type unsafe
    dulstring * s = *Args.aptr;
    int sockfd;
    char * path = strstr(s->content, ":") + 1;
    char hostbuf [1000];
    strncpy(hostbuf, s->content, path - s->content - 1);
    hostbuf[path - s->content - 1] = 0;
    int portno = atoi(path);
    struct hostent *server;
    struct sockaddr_in serv_addr;
    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    server = gethostbyname(hostbuf);
    memset(&serv_addr,0,sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_port = htons(portno);
    memcpy(&serv_addr.sin_addr.s_addr,server->h_addr,server->h_length);
    connect(sockfd,(struct sockaddr *)&serv_addr,sizeof(serv_addr));
    dulipchannel * chan = malloc(sizeof(dulipchannel));
    chan->type = &ipchannel;
    chan->refcnt = 0;
    chan->readfd = sockfd;
    chan->writefd = sockfd;
    return chan;
}
