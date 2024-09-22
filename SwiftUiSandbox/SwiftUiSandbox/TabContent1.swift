//
//  TabContent1.swift
//  SwiftUiSandbox
//
//  Created by Tomonori Shimomura on 2024-09-21.
//

import SwiftUI

struct TabContent1: View {
    
    @State var msg = "いいね"
    @State var input = ""

    var body: some View {

        NavigationLink("Navigation link", destination: NavigationDestinationView())

        HStack{
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.orange)
                .frame(width:30, height:30)

            Image("account-icon")
                .resizable()
                .frame(width:30, height:30)
        }

        HStack{
            Text("Hello, world!")
                .foregroundColor(.green)
                .background(.blue)
            Text("こんにちは").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Text("お元気ですか？").foregroundColor(.red)
        }
        
        Spacer()

        Text("This is regular text. This is **bold** text, this is *italic* text, and this is ***bold, italic*** text. ~~A strikethrough example~~. `Monospaced works too`. Visit Apple: [click here](https://apple.com)").textSelection(.enabled)

        Spacer()

        HStack{
            Button("Change text message"){
                msg = "最高"
            }
            Text(msg)
        }
        
        TextField("何かを入力してください:", text:$input)
        Text(input)
        
        Spacer()

        List{
            Text("Item1")
            Text("Item2")
            Text("Item3")
            Text("Item4")
            Text("Item5")
        }
        .listStyle(.sidebar)
    }
}

struct NavigationDestinationView: View {

    let cinema = ["Movie1", "Movie2", "Movie3"]

    var body: some View {
        VStack{
            Spacer()
            ForEach(cinema, id: \.self){
                item in Text(item)
                Spacer()
            }
        }
    }
}
