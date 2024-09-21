//
//  Logger.swift
//  LoggingApp
//
//  Created by Tomonori Shimomura on 2024-09-21.
//

import OSLog

extension Logger {
    //private static var subsystem = Bundle.main.bundleIdentifier!
    private static var subsystem = "com.yourcompanyname.yourappname"

    static let generic = Logger(subsystem: subsystem, category: "generic")
}
