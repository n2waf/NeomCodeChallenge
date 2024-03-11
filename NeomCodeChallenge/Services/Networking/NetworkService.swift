//
//  NetworkService.swift
//  NeomCodeChallenge
//
//  Created by Nawaf AlMuaither on 11/03/2024.
//

import Foundation
import Combine

enum NetworkService {
    internal static let base = URL(string: "https://api.sampleapis.com")!
    internal static let agent = Agent()
}
