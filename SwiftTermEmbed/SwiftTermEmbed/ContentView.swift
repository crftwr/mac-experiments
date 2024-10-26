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
                    if let term = SwiftTermView.table["123"] {
                        term.test()
                    }
                }
                Button("Test2"){
                }
                Button("Test3"){
                }
            }.padding()
            
            SwiftTermView()
                .setKey("123")

        }.padding()
    }
}

#Preview {
    ContentView()
}
