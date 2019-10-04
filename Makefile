MODULES =
API = API/bin_obj.c API/builtin.c API/dulbool.c API/rangeobject.c API/classobject.c API/funcobject.c API/number.c API/singleton.c	API/tuple.c API/hashname.c API/obimpl.c API/strimpl.c API/channel.c API/array.c API/Dulalloc.c API/dulint.c
PARSER = PARSER/ast.c PARSER/parser.c PARSER/asttobyc.c PARSER/parse.c
RE = RE/context.c RE/dulthread.c RE/std_linkage.c
all:
	clang ${API} ${PARSER} ${RE} ${MODULES} main.c buildscript.c -o ~/Dulang/dulang -ldl -lpthread -std=c11 -O3
	cd DLIB/JSON && make
	cd DLIB/server && make
	cd DLIB/fs && make
