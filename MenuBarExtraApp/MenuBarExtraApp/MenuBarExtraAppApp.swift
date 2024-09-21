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

        WindowGroup {
            ContentView()
        }
    }
}
