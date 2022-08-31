#include "greeter/src/greeter.h"
#include "zlib.h"
#include <iostream>
#include <string>
#include <google/protobuf/util/time_util.h>

using google::protobuf::util::TimeUtil;

std::string get_greet(const std::string& who) {
  return "Hello " + who;
}

// This C++ function can be called from C/Rust code
extern "C" void greet(std::int32_t n) {
    std::cout << ZLIB_VERSION << " # ";
    std::cout << TimeUtil::GetEpoch() << " - ";
    std::cout << get_greet("User") << n << "\n"; // It can use C++
}

