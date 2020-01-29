(function(){
    let common_styles;
    let node;
    let view;
    let createNode;
    let linkCSS;
    let document;
    common_styles = object(function(){
        this["linear"] = object(function(){
            this["display"] = "flex";
            this["flex"] = "1 0 auto";
            this["flex-direction"] = "row";
        });
        this["vertical"] = object(function(){
            this["display"] = "flex";
            this["flex"] = "1 0 auto";
            this["flex-direction"] = "column";
        });
    });
    node = function(){
        let view;
        return object(view)(function(){
            let array;
            this["tag"] = "div";
            this["children"] = array();
            this["style"] = object();
            this["attrs"] = object();
            this["hooks"] = object();
        });
    };
    view = object(function(){
        this["on"] = function(event){
            let _;
            _ = this;
            return function(handler){
                let _;
                let event;
                _["hooks"][event] = handler;
            };
        };
        this["attr"] = function(){
            this["attrs"][k] = v;
        };
        this["view"] = function(init_func){
            let templ;
            let node;
            templ = node();
            this["children"]["append"](templ(init_func));
            return templ;
        };
        this["render"] = function(){
            let style_repr;
            let prop;
            let children_repr;
            let child;
            let attr_repr;
            let hook_head;
            let hook_repr;
            let event;
            let toJS;
            let attr;
            style_repr = """;
            ;
            ;
            children_repr = "";
            ;
            ;
            attr_repr = "";
            hook_head = "";
            hook_repr = "<script>";
            ;
            ;
            ;
            ;
            return "<$0 id="$4" $5 $3 style=$1>$6 $2</$0>"["format"](this["tag"]style_reprchildren_reprattr_reprid(this)hook_headhook_repr);
        };
    });
    createNode = function(tag){
        return object(function(){
            let tag;
            let array;
            this["tag"] = tag;
            this["children"] = array();
            this["style"] = object(function(){
                this["padding"] = "0.5rem";
            });
            this["attrs"] = object();
            this["handlers"] = object();
            this["view"] = function(init_func){
                let new_elem;
                let createNode;
                new_elem = createNode("div");
                new_elem(init_func);
                this["children"]["append"](new_elem);
                return new_elem;
            };
            this["render"] = function(){
                let str_acc;
                let prop;
                let i;
                str_acc = "<$0 style=""["format"](this["tag"]);
                ;
                ;
                ;
                ;
                ;
                return str_acc;
            };
            this["prepare"] = function(){
                let node;
                node = this;
                return object(function(){
                    let node;
                    this["render"] = function(){
                        return this["repr"];
                    };
                    this["repr"] = node["render"]();
                });
            };
            this["on"] = function(event){
                let node;
                node = this;
                return function(handler){
                    let node;
                    let event;
                    node["handlers"][event] = handler;
                };
            };
            this["button"] = function(text){
                let new_elem;
                let createNode;
                new_elem = createNode("div");
                new_elem(function(){
                    let text;
                    this["style"] = object(function(){
                        this["border-radius"] = "0.5rem";
                        this["color"] = "white";
                        this["background"] = "#333333";
                        this["font-size"] = "1.25rem";
                        this["padding"] = "1rem";
                        this["align-self"] = "center";
                        this["display"] = "flex";
                        this["justify-content"] = "center";
                    });
                    this["text"] = text;
                });
                this["children"]["append"](new_elem);
                return new_elem;
            };
        });
    };
    linkCSS = function(resource){
        return object(function(){
            this["render"] = function(){
                let resource;
                return "<link rel='stylesheet' href='$0'>"["format"](resource);
            };
        });
    };
    document = function(init_func){
        let htmlDoc;
        let node;
        let head;
        htmlDoc = node();
        head = node();
        htmlDoc["tag"] = "html";
        htmlDoc(function(){
            let body;
            this["style"]["font-family"] = "Roboto, 'sans-serif'";
            body = this["view"](function(){
                this["tag"] = "body";
            });
            this["view"] = body["view"];
        });
        return htmlDoc(init_func);
    };
});
