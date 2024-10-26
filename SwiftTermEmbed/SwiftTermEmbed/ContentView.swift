//
//  ContentView.swift
//  SwiftTermEmbed
//
//  Created by Tomonori Shimomura on 2024-09-28.
//

import SwiftUI

struct ContentView: View {
    
    let termViewKey = UUID().uuidString
    
    var body: some View {
        VStack {
            
            HStack {
                Button("Run test command (ls)"){

                    let view = SwiftTermView.lookup(termViewKey)
                    if let view = view {
                        if let term = view as? SwiftTermView {
                            term.test()
                        }
                    }
                }
            }.padding()
            
            SwiftTermView()
                .lookupKey(termViewKey)

        }.padding()
    }
}

#Preview {
    ContentView()
}
