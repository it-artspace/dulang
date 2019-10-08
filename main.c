//
//  main.c
//  dulang
//
//  Created by Дмитрий Маслюков on 02/05/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include <stdio.h>
#include "api.h"
#include <time.h>
#include "INCLUDE/testparser.h"
#include "INCLUDE/dulthread.h"
#include <sys/socket.h>
#include <sys/un.h>
#include <libgen.h>
#include <unistd.h>
#include "buildscript.h"
#include <pthread.h>

FILE* output = 0;
#define addr "addr"

FILE*alloc_log = 0;

int f(int a, int b){
    return a + b;
}

int exec( char* inpuf )
{
    execute_command(inpuf);
	return 0;
}

pthread_mutex_t workload_lock = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t workload_cond = PTHREAD_COND_INITIALIZER;
volatile int final_context = 0;


void* workloop(void*a){
    current_thread = work_pool;
    while(1){
        pthread_mutex_lock(&workload_lock);
        while(!current_thread->workload){
            if(final_context)
                exit(0);
            pthread_cond_wait(&workload_cond, &workload_lock);
        }
        exec_thread_(current_thread);
        pthread_mutex_unlock(&workload_lock);
    }
    return 0;
}

int main(int argc, const char * argv[]) {
    init_shapes();
    init_mods();
    pthread_t work_tid;
    pthread_attr_t attrs;
    pthread_attr_init(&attrs);
    pthread_create(&work_tid, &attrs, &workloop, 0);
#if socket_runner
    int sockfd = socket(AF_UNIX, SOCK_STREAM, 0);
    struct sockaddr_un servaddr;
    bzero(&servaddr, sizeof(servaddr));
    servaddr.sun_family = AF_UNIX;
    strcpy(servaddr.sun_path, namebuf);
    unlink(namebuf);
    printf("serving %s\n", namebuf);
    bind(sockfd, (struct sockaddr *) &servaddr, sizeof(servaddr));
    listen(sockfd, 10);
    while(1){
        int clfd = accept(sockfd, 0, 0);
        FILE*f_bound = fdopen(clfd, "r+");
        output = f_bound;
        char script_buf [1024];
        while(fgets(script_buf, 1024, f_bound)){
            printf("%s",script_buf);
            exec(script_buf);
        }
        close(clfd);
    }
   
#else
    setup_aa();
    output = stdout;
    clock();
    // insert code here...
    char inpuf[1024];
    if( argc > 1 ) {
        inpuf[ 0 ] = '\0';
        for(int i = 1; i< argc; ++i){
            if( strlen( inpuf ) > 0 )
                strcat( inpuf, " " );
            strcat(inpuf, argv[i]);
        }
        strcat( inpuf, "\n" );
        exec( inpuf );
    }
    else
    {
        while(fgets(inpuf, 1024, stdin)){
            exec( inpuf );
        }
    }
    final_context = 1;
    pthread_join(work_tid, 0);
    return 0;
#endif
    
    
    
}
