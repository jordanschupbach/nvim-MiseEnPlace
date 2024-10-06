ffi = require("ffi")
messager = ffi.load("./lua/cxx/messager.so")

ffi.cdef[[ size_t my_strlen(const char* str); ]]

my_strlen("asdfasdfd")

messager.Messager()
messager.global_hello()
msg = messager.Messager()
messager.my_strlen("hello world")
messager = require("lua.cxx.messager")



-- swig -lua example.i -o example_wrap.c
-- gcc -I/usr/include/lua -c example_wrap.c -o example_wrap.o
-- gcc -c example.c -o example.o
-- gcc -shared -I/usr/include/lua -L/usr/lib/lua example_wrap.o example.o -o example.so
