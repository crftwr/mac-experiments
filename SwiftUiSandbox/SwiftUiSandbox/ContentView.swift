//
//  ContentView.swift
//  SwiftUiSandbox
//
//  Created by Shimomura, Tomonori on 2024-06-29.
//

import SwiftUI

struct ContentView: View {
    
    @State var msg = "いいね"
    @State var input = ""

    var body: some View {

        NavigationStack{
            VStack {
                TabView {
                    Tab("Tab1", systemImage: "tray.and.arrow.down.fill") {
                        NavigationLink("Navigation link", destination: SubView())

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
                    .badge(2)

                    Tab("Tab2", systemImage: "tray.and.arrow.up.fill") {
                        Text("Tab content 2")
                    }

                    Tab("Tab3", systemImage: "person.crop.circle.fill") {
                        Text("Tab content 3")
                    }
                    .badge("!")
                }
                
            }
            .padding()
        }
    }
}

struct SubView: View {

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


#Preview {
    ContentView()
}
