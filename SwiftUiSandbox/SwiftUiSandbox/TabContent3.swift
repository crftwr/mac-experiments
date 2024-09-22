//
//  TabContent1.swift
//  SwiftUiSandbox
//
//  Created by Tomonori Shimomura on 2024-09-21.
//

import SwiftUI

struct TabContent3: View {
    
    @State var message = ""
    @State var count = 0

    var body: some View {
        
        Button("Add a line"){
            let now = Date()
            self.count += 1
            
            let new_line = "\(now) \(count)\n"
            message += new_line
        }

        TextEditor(text: $message)
            .border(Color.black)
    }
}
