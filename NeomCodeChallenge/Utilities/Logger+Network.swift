//
//  Logger+Network.swift
//  NeomCodeChallenge
//
//  Created by Nawaf AlMuaither on 11/03/2024.
//

import Foundation

extension Logger {
    func logRequest(url: URL?, method: String?, body: Data?, headers: [String: String]?) {
        guard let url = url else {
            log(message: "URL is nil", event: .error)
            return
        }
        var logMessage = "🌐 Request: \(method ?? "UNKNOWN") \(url.absoluteString)"
        
        if let headers = headers, !headers.isEmpty {
            logMessage += "\n📝 Headers: " + headers.map { "\($0): \($1)" }.joined(separator: ", ")
        }
        
        if let body = body, let bodyString = String(data: body, encoding: .utf8), !bodyString.isEmpty {
            logMessage += "\n📦 Body: " + bodyString
        }
        
        log(message: logMessage, event: .info)
    }

    func logResponse(url: URL?, statusCode: Int, response: Data?, error: Error?, maxLength: Int = 2048) {
        guard let url = url else {
            log(message: "URL is nil", event: .error)
            return
        }
        
        var logMessage = "🌍 Response: \(url.absoluteString)\n Status Code: \(statusCode)\n"
        
        if let error = error {
            logMessage += "🔴 Error: \(error.localizedDescription)"
        } else if let response = response {
            if response.count > maxLength {
                logMessage += "Response data is too large (\(response.count) bytes). Limit is \(maxLength) bytes."
            } else {
                logMessage += "📄 Body: \n" + prettyPrintedJson(from: response)
            }
        }
        
        log(message: logMessage, event: .info)
    }
}


extension Logger {
    private func prettyPrintedJson(from data: Data) -> String {
        guard let object = try? JSONSerialization.jsonObject(with: data, options: []),
              let prettyData = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = String(data: prettyData, encoding: .utf8) else {
            return "Could not format JSON"
        }
        
        let lines = prettyPrintedString.components(separatedBy: "\n")
        if lines.count > maxLines {
            return "Output is too large and contains \(lines.count) lines. Only showing the first \(maxLines) lines:\n" + lines.prefix(maxLines).joined(separator: "\n")
        }
        
        return prettyPrintedString
    }
}
