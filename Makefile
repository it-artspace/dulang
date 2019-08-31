API = API/bin_obj.c API/builtin.c API/dulbool.c API/rangeobject.c API/classobject.c API/funcobject.c API/number.c API/singleton.c	API/tuple.c API/hashname.c API/obimpl.c API/strimpl.c API/channel.c API/array.c
PARSER = PARSER/ast.c PARSER/parser.c PARSER/asttobyc.c PARSER/parse.c
RE = RE/context.c RE/dulthread.c RE/std_linkage.c
all:
	cc ${API} ${PARSER} ${RE} main.c buildscript.c -o ~/Dulang/dulang -ldl -lpthread
