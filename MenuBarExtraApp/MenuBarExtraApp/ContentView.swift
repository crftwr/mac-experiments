//
//  ContentView.swift
//  MenuBarExtraApp
//
//  Created by Tomonori Shimomura on 2024-09-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
            
            Button("Test1"){
                print("Test1")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
