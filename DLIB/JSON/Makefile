API = 	../../API/builtin.c ../../API/dulbool.c ../../API/rangeobject.c ../../API/classobject.c ../../API/funcobject.c ../../API/number.c ../../API/singleton.c	../../API/tuple.c ../../API/hashname.c ../../API/obimpl.c ../../API/strimpl.c  ../../API/array.c
all:
	clang -I../.. json.c ${API} -fpic -shared -o json.so -Wl,-U,_getmodule
