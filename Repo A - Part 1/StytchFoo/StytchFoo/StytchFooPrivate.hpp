#ifndef STYTCHFOO_HPP
#define STYTCHFOO_HPP

#include <string>

class StytchFooPrivate {
public:
    std::string getString();
    std::string processString(const std::string &input);
};

#endif
