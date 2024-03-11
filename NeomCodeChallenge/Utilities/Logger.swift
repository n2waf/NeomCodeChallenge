//
//  Logger.swift
//  NeomCodeChallenge
//
//  Created by Nawaf AlMuaither on 11/03/2024.
//

import Foundation

enum LogEvent: String {
    case error = "🔴 Error"
    case info = "ℹ️ Info"
    case debug = "🐛 Debug"
    case warning = "⚠️ Warning"
    case success = "✅ Success"
}

class Logger {
    static let shared = Logger()
    internal let maxLines = 20
    
    private init() {}

    func log(message: String, event: LogEvent) {
        #if DEBUG
        print("\(Date().toString()) \(event.rawValue) : \(message)")
        #endif
    }

}

fileprivate extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssSSS"
        return dateFormatter.string(from: self)
    }
}
