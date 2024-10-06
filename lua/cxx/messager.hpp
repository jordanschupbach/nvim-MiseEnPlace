#pragma once

class Messager {
public:
  Messager();
  void say_hello();
  double get_val();
  void set_val(double val);

private:
  double val;

};

void global_hello();

