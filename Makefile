API = API/builtin.c API/dulbool.c API/rangeobject.c API/classobject.c API/funcobject.c API/number.c API/singleton.c	API/tuple.c API/dularr.c API/hashname.c API/obimpl.c API/strimpl.c
PARSER = PARSER/ast.c PARSER/parser.c PARSER/asttobyc.c PARSER/parse.c PARSER/testparser.c
RE = RE/context.c RE/dulthread.c RE/std_linkage.c
all:
	cc ${API} ${PARSER} ${RE} main.c -o ~/Dulang/dulang
