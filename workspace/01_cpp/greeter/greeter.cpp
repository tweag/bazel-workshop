#include "greeter/greeter.h"
#include <iostream>
#include <string>

std::string get_greet(const std::string& who) {
  return "Hello " + who;
}
