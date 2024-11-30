//
//  TabContent1.swift
//  SwiftUiSandbox
//
//  Created by Tomonori Shimomura on 2024-09-21.
//

import SwiftUI

struct TabContent3: View {
    
    enum Field: Hashable {
        case textField
        //case list
    }
    
    @FocusState private var focusedField: Field?
    @State private var focusedListItem: Int = 0

    
    let names = ["Holly", "Josh", "Rhonda", "Ted", "Item001", "Item002", "Item003", "Item004"]
    @State private var searchText = ""

    @State private var scrollPosition = ScrollPosition(edge: .top)

    var body: some View {
        
        HStack {
            Image("search")
                .imageScale(.medium)
                .frame(width: 16, height: 8, alignment: .center)
            TextField("Search", text: $searchText)
                .focused($focusedField, equals: .textField)
                .onChange(of: searchText) { oldValue, newValue in
                    focusedListItem = 0
                }
        }
        .onAppear() {
            focusedField = .textField
        }
        .onKeyPress(.upArrow) {

            let searchResults = self.searchResults

            focusedListItem = max(focusedListItem-1, 0)
            if focusedListItem < searchResults.count {
                scrollPosition.scrollTo(id: searchResults[focusedListItem], anchor: .top)
            }
            else {
                scrollPosition.scrollTo(edge: .top)
            }

            return .handled
        }
        .onKeyPress(.downArrow) {

            let searchResults = self.searchResults

            focusedListItem = max(min(focusedListItem+1, searchResults.count-1), 0)
            if focusedListItem < searchResults.count {
                scrollPosition.scrollTo(id: searchResults[focusedListItem], anchor: .bottom)
            }
            else {
                scrollPosition.scrollTo(edge: .top)
            }

            return .handled
        }

        ScrollView {
            LazyVStack {
                let searchResults = self.searchResults
                
                ForEach(Array(searchResults.enumerated()), id: \.element) { index, name in
                    
                    let focused = focusedListItem == index
                    
                    HStack {
                        Text("📋")
                            .font(.system(size: 8))
                            .frame(width: 12)
                            .foregroundStyle(.opacity(0.5))

                        Text(name)
                        
                        Spacer()
                    }
                    .id(name)
                    .background(focused ? Color.blue.opacity(0.3) : Color.clear)
                }
            }
            .padding(.all, 8)
        }
        .background(Color.white)
//        .focusable()
//        .focused($focusedField, equals: .list)
        .scrollPosition($scrollPosition)
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

