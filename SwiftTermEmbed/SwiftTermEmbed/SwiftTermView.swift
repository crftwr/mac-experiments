//
//  SwiftTermView.swift
//  SwiftTermEmbed
//
//  Created by Tomonori Shimomura on 2024-09-28.
//

import SwiftUI

struct SwiftTermView: NSViewControllerRepresentable {
    
    typealias NSViewControllerType = SwiftTermViewController
    
    let viewController: SwiftTermViewController = SwiftTermViewController()
    
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
