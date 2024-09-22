//
//  TabContent1.swift
//  SwiftUiSandbox
//
//  Created by Tomonori Shimomura on 2024-09-21.
//

import SwiftUI

struct TabContent2: View {
    
    @State var message_lines: [String] = []
    @State var count = 0
    let max_lines = 100
    
    var message: String {
        return message_lines.joined()
    }

    var body: some View {
        
        Button("Add a line"){
            let now = Date()
            self.count += 1
            
            message_lines.append("\(now) \(count)\n")
            
            if message_lines.count > max_lines {
                message_lines.removeFirst( message_lines.count - max_lines )
            }
        }

        ScrollView{
            Text(self.message)
                .textSelection(.enabled)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
        }
        .border(Color.black)

    }
}
