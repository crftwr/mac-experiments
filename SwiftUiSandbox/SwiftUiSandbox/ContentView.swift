//
//  ContentView.swift
//  SwiftUiSandbox
//
//  Created by Shimomura, Tomonori on 2024-06-29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        @State var msg = "いいね"
        @State var input = ""

        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.orange)
            
            Text("Hello, world!")
                .foregroundColor(.green)
                .background(.blue)
            
            HStack{
                Text("こんにちは").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Text("お元気ですか？").foregroundColor(.red)
            }
            
            Text(msg)
            Button("Change"){
                msg = "最高"
            }
            
            TextField("何かを入力してください:", text:$input)
            Text(input)
            
            List{
                Text("Item1")
                Text("Item2")
                Text("Item3")
                Text("Item4")
                Text("Item5")
            }
            
            Image("account-icon")
                .resizable()
                .frame(width:50, height:50)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
