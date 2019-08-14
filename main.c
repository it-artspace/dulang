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

FILE* output = 0;






int exec( char* inpuf )
{
    execute_command(inpuf);
	return 0;
}

int main(int argc, const char * argv[]) {
    
#if socket_runner
    int sockfd = socket(AF_UNIX, SOCK_STREAM, 0);
    struct sockaddr_un servaddr;
    bzero(&servaddr, sizeof(servaddr));
    servaddr.sun_family = AF_UNIX;
    strcpy(servaddr.sun_path, "/Users/jernicozz/Documents/dulang.vm");
    unlink("/Users/jernicozz/Documents/dulang.vm");
    bind(sockfd, (struct sockaddr *) &servaddr, sizeof(servaddr));
    listen(sockfd, 10);
    while(1){
        int clfd = accept(sockfd, 0, 0);
        FILE*f_bound = fdopen(clfd, "r+");
        output = f_bound;
        char script_buf [1024];
        while(fgets(script_buf, 1024, f_bound)){
            printf(script_buf);
            exec(script_buf);
            fprintf(output, "--end--");
            fflush(output);
        }
        close(clfd);
    }
   
#else
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
    
    return 0;
#endif
    
    
    
}
