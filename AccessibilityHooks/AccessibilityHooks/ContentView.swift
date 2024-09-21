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

                if self.keyboard_hook != nil {
                    print("Keyboard hook is already installed.")
                    return
                }
                
                self.keyboard_hook = KeyboardHook()
                if let keyboard_hook = self.keyboard_hook {
                    keyboard_hook.install()
                }
            }
            
            Button("Uninstall keyboard hook"){
                
                if let keyboard_hook = self.keyboard_hook {
                    keyboard_hook.uninstall()
                }
                
                self.keyboard_hook = nil
            }
            
            Button("Send key event"){

                if let keyboard_hook = self.keyboard_hook {
                    keyboard_hook.sendKey()
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
