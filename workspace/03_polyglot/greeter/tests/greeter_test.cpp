#include "gtest/gtest.h"
#include "greeter/src/greeter.h"

TEST(GreetingShould, ReturnHelloWorld){
    std::string who = "World!";
    std::string actual = get_greet(who);
    std::string expected = "Hello World!";
    EXPECT_EQ(expected, actual);
}
