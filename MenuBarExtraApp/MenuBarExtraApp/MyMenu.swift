//
//  ContentView.swift
//  MenuBarExtraApp
//
//  Created by Tomonori Shimomura on 2024-09-21.
//

import SwiftUI

struct MyMenu: View {
    var body: some View {
        Button("Test1"){
            print("Test1")
        }.keyboardShortcut("1")
        Button("Test2"){
            print("Test2")
        }
        
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
