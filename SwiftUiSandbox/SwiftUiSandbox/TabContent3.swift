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
        
        HStack {
            Image("search")
                .imageScale(.medium)
                .frame(width: 16, height: 8, alignment: .center)
            TextField("Search", text: $searchText)
        }
            
        List {
            ForEach(searchResults, id: \.self) { name in
                HStack {
                    Text("📋")
                        .font(.system(size: 8))
                        .frame(width: 12)
                        .foregroundStyle(.opacity(0.5))

                    Text(name)
                }
            }
        }
        .listStyle(.plain)
    }

    var searchResults: [AttributedString] {
        if searchText.isEmpty {
            let filteredNames = names
            let attributedNames = filteredNames.map {
                // FIXME: escape
                try! AttributedString(markdown: $0)
            }
            return attributedNames
        } else {
            let filteredNames = names.filter { $0.contains(searchText) }
            let attributedNames = filteredNames.map {
                // FIXME: escape
                try! AttributedString(markdown: $0.replacingOccurrences(of: searchText, with: String(format: "**%@**", searchText) ))
            }
            return attributedNames
        }
    }
}

