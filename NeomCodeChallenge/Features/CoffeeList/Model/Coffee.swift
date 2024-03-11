//
//  Coffee.swift
//  NeomCodeChallenge
//
//  Created by Nawaf AlMuaither on 11/03/2024.
//

import Foundation

struct Coffee: Codable, Identifiable {
    var id: Int
    var title: String
    var description: String
    var ingredients: [String]
    var image: URL
}
