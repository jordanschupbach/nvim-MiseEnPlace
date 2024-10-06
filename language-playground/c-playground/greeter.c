
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

#include "greeter.h"

mep_greeter_t* mep_greeter_alloc(const char* name) {
  mep_greeter_t* greeter = malloc(sizeof(mep_greeter_t));
  greeter->name = strdup(name);
  return greeter;
}

void mep_greeter_greet(mep_greeter_t* greeter) {
  printf("Hello, %s!\n", greeter->name);
}

void mep_greeter_free(mep_greeter_t* greeter) {
  free(greeter->name);
  free(greeter);
}
