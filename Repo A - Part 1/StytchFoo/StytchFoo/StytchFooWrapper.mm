#import "StytchFooWrapper.h"
#include "StytchFooPrivate.hpp"

@implementation StytchFoo {
    StytchFooPrivate *stytchFooPrivate;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        stytchFooPrivate = new StytchFooPrivate();
    }
    return self;
}

- (NSString *)getString {
    std::string cppString = stytchFooPrivate->getString();
    return [NSString stringWithUTF8String:cppString.c_str()];
}

- (NSString *)processString:(NSString *)input {
    std::string cppInput = std::string([input UTF8String]);             // Convert NSString to std::string
    std::string cppOutput = stytchFooPrivate->processString(cppInput);  // Call C++ function
    return [NSString stringWithUTF8String:cppOutput.c_str()];           // Convert std::string back to NSString
}

- (void)dealloc {
    delete stytchFooPrivate;
}

@end
