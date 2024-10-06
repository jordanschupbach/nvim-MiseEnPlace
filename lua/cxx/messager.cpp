#include "messager.hpp"

#include <iostream>
#include <string.h>

Messager::Messager() : val(42.0) {}

double Messager::get_val() {
  return val;
}

void Messager::set_val(double val) {
  this->val = val;
}

void Messager::say_hello() {
  std::cout << "Hello world" << std::endl;
}

void global_hello() {
  std::cout << "Hello global" << std::endl;
}


size_t my_strlen(const char* str) {
    return strlen(str);
}

