
CC=gcc
CXX=g++

all: build shared swig

swig: 
	swig -c++ -lua messager.i

shared: messager.o swig
	$(CXX) --shared messager.hpp messager_wrap.cxx messager.cpp -fPIC -o messager.so

messager.hpp:
	$(CXX) messager.hpp -o messager.o 

build: messager.o test.cpp messager.cpp
	$(CXX) test.cpp messager.cpp messager.hpp -o test

run: all
	./test

