//
//  SwiftTermView.swift
//  SwiftTermEmbed
//
//  Created by Tomonori Shimomura on 2024-09-28.
//

import SwiftUI

struct SwiftTermView: NSViewControllerRepresentable {
    
    typealias NSViewControllerType = SwiftTermViewController
    
    static var table: [String: SwiftTermView] = [:]
    let viewController: SwiftTermViewController = SwiftTermViewController()
    
    init() {
        print("SwiftTermView initialized")
    }
    
    func setKey(_ key: String) -> Self {
        SwiftTermView.table[key] = self
        return self
    }
    
    func test() {
        print("SwiftTermView test")
        viewController.test()
    }
    
    func makeNSViewController(context: Context) -> SwiftTermViewController {
        return viewController
    }
    
    func updateNSViewController(_ nsViewController: SwiftTermViewController, context: Context) {
    }
}
