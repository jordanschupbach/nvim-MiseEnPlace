#pragma once

struct mep_greeter {
  char* name;
};

typedef struct mep_greeter mep_greeter_t;

mep_greeter_t* mep_greeter_alloc(const char* name);

void mep_greeter_greet(mep_greeter_t* greeter);

void mep_greeter_free(mep_greeter_t* greeter);

