//
//  CppBridge.cpp
//  SwiftPythonEmbed
//
//  Created by Shimomura, Tomonori on 2024-06-29.
//

#include <stdio.h>

#include "CppBridge.hpp"

int HelloFromCpp( int n )
{
    printf( "Hello From C++ : n=%d\n", n );
    return n+1;
}
