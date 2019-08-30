//
//  server.c
//  NIolang
//
//  Created by Дмитрий Маслюков on 26/08/2019.
//  Copyright © 2019 Дмитрий Маслюков. All rights reserved.
//

#include "../api.h"
#include "../INCLUDE/dulthread.h"
#include <stdio.h>
#include <sys/socket.h>
#include <unistd.h>
#include <netinet/in.h> /* struct sockaddr_in, struct sockaddr */
#include <netdb.h> /* struct hostent, gethostbyname */
#include <arpa/inet.h>
#import <fcntl.h>
#include <openssl/ssl.h>
#include <openssl/err.h>
#include <pthread.h>

static SSL_CTX * ctx;
static int sockfd;
static const char * okhdr = "HTTP/1.1 200 OK\r\nContent-length:";
static const char * okbody = "\r\nContent-Type: %s\r\nConnection: close\r\n\r\n";
static const char * statdir = "/Users/jernicozz/Downloads/intsys";
static SSL_CTX *create_context()
{
    const SSL_METHOD *method;
    SSL_CTX *ctx;
    
    method = SSLv23_server_method();
    
    ctx = SSL_CTX_new(method);
    if (!ctx) {
        perror("Unable to create SSL context");
        ERR_print_errors_fp(stderr);
        exit(EXIT_FAILURE);
    }
    
    return ctx;
}

static void configure_context(SSL_CTX *ctx)
{
    SSL_CTX_set_ecdh_auto(ctx, 1);
    
    /* Set the key and cert */
    if (SSL_CTX_use_certificate_file(ctx, "/Users/jernicozz/Documents/NIolang/DLIB/cert.pem", SSL_FILETYPE_PEM) <= 0) {
        ERR_print_errors_fp(stderr);
        exit(EXIT_FAILURE);
    }
    
    if (SSL_CTX_use_PrivateKey_file(ctx, "/Users/jernicozz/Documents/NIolang/DLIB/key.pem", SSL_FILETYPE_PEM) <= 0 ) {
        ERR_print_errors_fp(stderr);
        exit(EXIT_FAILURE);
    }
}

BIN_DECL(page_send){
    dulstring * fname = (dulstring*)*Args.aptr;
    dulstring * content = (dulstring*)allocstr();
    FILE* f = fopen(fname->content, "r");
    size_t ssize = fseek(f, 0, SEEK_END);
    char bodybuf [100];
    char * ext = strrchr(fname->content, '.') + 1;
    char * mime = "text/html";
    if(strcmp(ext, "js")==0){
        mime = "application/javascript";
    }
    if(strcmp(ext, "css")==0){
        mime = "text/css";
    }
    sprintf(bodybuf, okbody, mime);
    
    long fsize = ftell(f);
    ssize = fsize + 10 + strlen(okhdr) + strlen(bodybuf);
    rewind(f);
    char * sc = malloc(ssize + 1);
    char *wr = sc;
    wr += sprintf(sc, "%s%d%%s", okhdr, fsize, bodybuf);
    fread(wr, ssize, 1, f);
    free(content->content);
    content->len = (int)ssize;
    content->cap = (int)ssize;
    content->content = sc;
    fclose(f);
    return (object*)content;
}


BIN_DECL(__listen){
    // arg is portno
    int portno;
    object * arg = *Args.aptr;
    if(Args.a_passed == 0){
        //okay, lets serve 9277
        portno = 9277;
    } else {
        if(arg->type->type_id != number_id){
            portno = 9277;
        } else {
            dulnumber * ob_portno = (dulnumber*)arg;
            portno = ob_portno->val;
        }
    }
    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    struct sockaddr_in servaddr;
    servaddr.sin_family    = AF_INET;
    servaddr.sin_addr.s_addr = INADDR_ANY;
    servaddr.sin_port = htons(portno);
    int enable = 1;
    
    setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &enable, sizeof(int));
    bind(sockfd, (struct sockaddr*)&servaddr, sizeof(servaddr));
    listen(sockfd, 100);
    printf("listening %d", portno);
    return 0;
}


typedef struct {
    ObHead
    int clfd;
} connection;
const struct obtype conntype = {
        "conn",
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
};
connection * new_conn(int clfd){
    connection *conn = malloc(sizeof(connection));
    //is self-finalized
    conn->type = &conntype;
    conn->refcnt = 1;
    conn->type = 0;
    conn->clfd = clfd;
    return conn;
}


BIN_DECL(__finalize){
    connection * c = (connection*)Args.aptr[0];
    dulstring * s = (dulstring*)Args.aptr[1];
    if(strstr(s->content, "HTTP/1.1") != 0){
        write(c->clfd, okhdr, strlen(okhdr));
        char clen [10];
        sprintf(clen, "%d", s->len);
        char body [1000];
        sprintf(body, okbody, "text/html");
        write(c->clfd, clen, strlen(clen));
        write(c->clfd, body, strlen(body));
    }
    
    write(c->clfd, s->content, s->len);
    close(c->clfd);
    free(c);
    return 0;
}

BIN_DECL(__accept){
    int clfd = accept(sockfd, 0, 0);
    char rdbuf [4096];
#warning TODO: post req
        //firstly read the headers
    read(clfd, rdbuf, 4096);
    char type[10];
    char path [1024];
    sscanf(rdbuf, "%s%s", type, path);
    char * path_wo_params = strtok(path, "?");
    if(strstr(path_wo_params, "/static/") == path_wo_params){
        char strbuf [200];
        sprintf(strbuf, "%s%s", statdir, path_wo_params);
        FILE * f = fopen(strbuf, "r");
        fseek(f, 0, SEEK_END);
        long len = ftell(f);
        rewind(f);
        write(clfd, okhdr, strlen(okhdr));
        char clen [10];
        char bodybuf [100];
        char * ext = strchr(strbuf, '.') + 1;
        char * mime = "text/html";
        printf("extension %s\n\n", ext);
        if(strcmp(ext, "js")==0){
            mime = "application/javascript";
        }
        if(strcmp(ext, "css")==0){
            mime = "text/css";
        }
        sprintf(bodybuf, okbody, mime);
        sprintf(clen, "%d", len);
        write(clfd, clen, strlen(clen));
        write(clfd, bodybuf, strlen(bodybuf));
        char *rdbuf = malloc(len);
        fread(rdbuf, len, 1, f);
        write(clfd, rdbuf, len);
        fclose(f);
        free(rdbuf);
        close(clfd);
        return 0;
    }
    object * lookup_ob = strfromchar(path_wo_params);
    char * iterparam = strtok(NULL, "&");
    object* params = new_ob();
    while(iterparam){
        char * name = strtok(iterparam, "=");
        char * val = strtok(NULL, "");
        object * ob_name = strfromchar(name);
        object * ob_val = strfromchar(val);
        ob_subscr_set(params, ob_name, ob_val);
    }
    return mktuple_va(3, (object*)new_conn(clfd), lookup_ob, params);
}




