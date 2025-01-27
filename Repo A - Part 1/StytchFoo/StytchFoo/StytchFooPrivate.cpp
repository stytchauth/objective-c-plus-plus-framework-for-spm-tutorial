#include "StytchFooPrivate.hpp"
#include <iostream>
#include <string>

std::string StytchFooPrivate::getString() {
    return "Stytch Rules!";
}

std::string StytchFooPrivate::processString(const std::string &input) {
    return "C++ string received: " + input;
}
