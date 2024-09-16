//
//  ContentView.swift
//  AccessibilityHooks
//
//  Created by Tomonori Shimomura on 2024-09-15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Install keyboard hook"){
                
                if keyboard_hook != nil {
                    print("Keyboard hook is already installed.")
                    return
                }
                
                keyboard_hook = KeyboardHook()
                keyboard_hook!.Install()
            }
            Button("Uninstall keyboard hook"){

                if let existing_keyboard_hook = keyboard_hook {
                    existing_keyboard_hook.Uninstall()
                    keyboard_hook = nil
                }
            }
        }
        .padding()
    }
    
    @State var keyboard_hook: KeyboardHook? = nil
}

#Preview {
    ContentView()
}
