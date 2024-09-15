//
//  CppBridge.cpp
//  SwiftPythonEmbed
//
//  Created by Shimomura, Tomonori on 2024-06-29.
//

#include <stdio.h>

#include "CppBridge.hpp"


int HelloFuncC( int n )
{
    printf( "Hello From C : n=%d\n", n );
    return n+1;
}

int HelloFuncCpp( int n )
{
    printf( "Hello From C++ : n=%d\n", n );
    return n+1;
}

// ---

HelloClass::HelloClass(int _base)
    :
    base(_base)
{
    printf("HelloClass constructor\n");
    
    base = _base;
}

HelloClass::~HelloClass()
{
    printf("HelloClass destructor\n");
}

int HelloClass::SayHello(int n)
{
    printf( "Hello From HelloClass : n=%d\n", n );
    return n+base;
}
