//
//  CppBridge.hpp
//  SwiftPythonEmbed
//
//  Created by Shimomura, Tomonori on 2024-06-29.
//

#ifndef CppBridge_hpp
#define CppBridge_hpp

#ifdef __cplusplus
#define EXTERN_C extern "C"
#else
#define EXTERN_C
#endif

EXTERN_C int HelloFromCpp( int n );

#endif /* CppBridge_hpp */
