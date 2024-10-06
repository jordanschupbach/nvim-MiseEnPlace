#include "greeter.h"

int main(void) {
  mep_greeter_t* greeter = mep_greeter_alloc("MisEnPlace");
  mep_greeter_greet(greeter);
  mep_greeter_free(greeter);
  return 0;
}

