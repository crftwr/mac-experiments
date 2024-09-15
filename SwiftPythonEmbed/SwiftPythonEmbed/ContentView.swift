//
//  ContentView.swift
//  SwiftPythonEmbed
//
//  Created by Shimomura, Tomonori on 2024-06-29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("Test"){
                var result = HelloFuncC(123)
                print(String(format: "Result from C func: %d", result))

                result = HelloFuncCpp(123)
                print(String(format: "Result from C++ func: %d", result))

                var cpp_hello = HelloClass(1000)
                result = cpp_hello.SayHello(123)
                print(String(format: "Result from C++ class: %d", result))
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
