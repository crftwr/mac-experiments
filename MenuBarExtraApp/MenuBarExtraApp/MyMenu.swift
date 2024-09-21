//
//  ContentView.swift
//  MenuBarExtraApp
//
//  Created by Tomonori Shimomura on 2024-09-21.
//

import SwiftUI

struct MyMenu: View {
    
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        Button("Open Main Window"){
            openWindow(id: "main")
        }.keyboardShortcut("1")

        Divider()
        
        Menu("Submenu") {
            Button("Test3"){
                print("Test3")
            }
            Button("Test4"){
                print("Test4")
            }
        }

        Button("Quit"){
            print("Quit")
            NSApplication.shared.terminate(nil)
        }.keyboardShortcut("q")
    }
}
