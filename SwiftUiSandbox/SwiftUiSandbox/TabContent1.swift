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
        Button("Change text message"){
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
}

struct NavigationDestinationView: View {

    let cinema = ["Movie1", "Movie2", "Movie3"]

    var body: some View {
        VStack{
            VStack{
                Spacer()
                ForEach(cinema, id: \.self){
                    item in Text(item)
                    Spacer()
                }
            }
        }
    }
}
