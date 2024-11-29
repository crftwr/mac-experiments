//
//  TabContent1.swift
//  SwiftUiSandbox
//
//  Created by Tomonori Shimomura on 2024-09-21.
//

import SwiftUI

struct TabContent3: View {
    let names = ["Holly", "Josh", "Rhonda", "Ted"]
    @State private var searchText = ""

    var body: some View {
        
        TextField("Search", text: $searchText)
        
        List {
            ForEach(searchResults, id: \.self) { name in
                Text(name)
            }
        }
    }

    var searchResults: [AttributedString] {
        if searchText.isEmpty {
            let names3 = names.map {
                try! AttributedString(markdown: $0.replacingOccurrences(of: searchText, with: String(format: "**%@**", searchText) ))
            }
            return names3

        } else {
            let names2 = names.filter { $0.contains(searchText) }
            let names3 = names2.map {
                try! AttributedString(markdown: $0.replacingOccurrences(of: searchText, with: String(format: "**%@**", searchText) ))
            }
            return names3
        }
    }
}

