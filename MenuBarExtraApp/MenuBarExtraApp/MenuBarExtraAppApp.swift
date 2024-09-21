//
//  MenuBarExtraAppApp.swift
//  MenuBarExtraApp
//
//  Created by Tomonori Shimomura on 2024-09-21.
//

import SwiftUI

@main
struct MenuBarExtraAppApp: App {
    var body: some Scene {
        
        MenuBarExtra("UtilityApp", systemImage: "hammer") {
            MyMenu()
        }

        // Use Window instead of WindowGroup to open only 1 window at most
        Window("Main", id: "main") {
            ContentView()
        }
    }
}
