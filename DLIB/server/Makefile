API = 	../../API/builtin.c ../../API/dulbool.c ../../API/rangeobject.c ../../API/classobject.c ../../API/funcobject.c ../../API/number.c ../../API/singleton.c	../../API/tuple.c ../../API/hashname.c ../../API/obimpl.c ../../API/strimpl.c  ../../API/array.c
all:
	cc server.c ${API}  -ldl -I/usr/local/opt/openssl/include -L/usr/local/opt/openssl/lib -lssl -lcrypto -fPIC -shared -o serv.so
