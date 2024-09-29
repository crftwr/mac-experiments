//
//  ContentView.swift
//  SwiftTermEmbed
//
//  Created by Tomonori Shimomura on 2024-09-28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            HStack {
                Button("Test1"){
                }
                Button("Test2"){
                }
                Button("Test3"){
                }
            }.padding()
            
            SwiftTermView()
        }.padding()
    }
}

#Preview {
    ContentView()
}
