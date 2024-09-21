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

                Logger.generic.info("Log from OSLog - info")
                Logger.generic.notice("Log from OSLog - notice")
                Logger.generic.critical("Log from OSLog - critical")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
