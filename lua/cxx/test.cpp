#include "messager.hpp"

#include <iostream>

int main(void) {
  Messager msgr = Messager();
  std::cout << msgr.get_val() << std::endl;
  msgr.set_val(29);
  std::cout << msgr.get_val() << std::endl;
  msgr.say_hello();

}
