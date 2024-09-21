//
//  ContentView.swift
//  LoggingApp
//
//  Created by Tomonori Shimomura on 2024-09-21.
//

import SwiftUI
import OSLog

struct ContentView: View {    
    var body: some View {
        VStack {
            Button("Logging test"){
                Logger.generic.notice("Log from OSLog")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
