(function(){
    let app;
    ;
    app = object(function(){
        let server;
        this["router"] = object();
        this["launch"] = function(portno){
            let server;
            let accept;
            let conn;
            let path;
            let params;
            let handler;
            let res;
            server["Dullisten"](portno);
            ;
        };
        this["sendPage"] = server["Dulpage_send"];
        this["route"] = function(path){
            let app;
            app = this;
            return function(callback){
                let app;
                let path;
                app["router"][path] = callback;
            };
        };
        this["setStatic"] = server["Dul_set_stat"];
    });
});
