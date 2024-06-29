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
                let result = HelloFromCpp(123)
                print(String(format: "Result from C++: %d", result))
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
