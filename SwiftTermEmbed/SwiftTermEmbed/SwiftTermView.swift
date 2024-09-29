//
//  SwiftTermView.swift
//  SwiftTermEmbed
//
//  Created by Tomonori Shimomura on 2024-09-28.
//

import SwiftUI

struct SwiftTermView: NSViewControllerRepresentable {
    
    let data = ["green", "blue", "red"]
    
    typealias NSViewControllerType = SwiftTermViewController
    
    func makeNSViewController(context: Context) -> SwiftTermViewController {
        let viewController = SwiftTermViewController()
        //viewController.arrangedObjects = data
        //viewController.delegate = viewController
        return viewController
    }
    
    func updateNSViewController(_ nsViewController: SwiftTermViewController, context: Context) {
        
    }
    
}
