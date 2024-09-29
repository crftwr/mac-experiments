//
//  SwiftTermView.swift
//  SwiftTermEmbed
//
//  Created by Tomonori Shimomura on 2024-09-28.
//

import SwiftUI

struct SwiftTermView: NSViewControllerRepresentable {
    
    typealias NSViewControllerType = SwiftTermViewController
    
    func makeNSViewController(context: Context) -> SwiftTermViewController {
        let viewController = SwiftTermViewController()
        return viewController
    }
    
    func updateNSViewController(_ nsViewController: SwiftTermViewController, context: Context) {
    }
}
