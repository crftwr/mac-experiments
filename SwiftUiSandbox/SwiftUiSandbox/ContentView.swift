//
//  ContentView.swift
//  SwiftUiSandbox
//
//  Created by Shimomura, Tomonori on 2024-06-29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack {
                TabView {
                    Tab("Tab1", systemImage: "tray.and.arrow.down.fill") {
                        TabContent1()
                    }
                    .badge(2)

                    Tab("Tab2", systemImage: "tray.and.arrow.up.fill") {
                        TabContent2()
                    }

                    Tab("Tab3", systemImage: "person.crop.circle.fill") {
                        TabContent3()
                    }
                    .badge("!")
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
