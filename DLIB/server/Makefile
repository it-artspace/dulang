API = 	../../API/builtin.c ../../API/dulbool.c ../../API/rangeobject.c ../../API/classobject.c ../../API/number.c ../../API/singleton.c	../../API/tuple.c ../../API/hashname.c ../../API/obimpl.c ../../API/strimpl.c  ../../API/array.c ../../API/shapeobject.c
all:
	gcc server.c ${API} ${RE} -fPIC -shared -g -o ~/Dulang/NIolang/DLIB/server/serv.so -ldl -lpthread
