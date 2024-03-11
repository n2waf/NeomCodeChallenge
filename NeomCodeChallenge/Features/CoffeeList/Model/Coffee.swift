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

extension Coffee {
    static var sample: Coffee {
        Coffee(id: 1,
               title: "Cappuccino",
               description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sollicitudin justo nisl, eu eleifend ligula efficitur non. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam sed laoreet justo. Suspendisse quis orci at nibh elementum vehicula id nec massa.",
               ingredients: ["",""],
               image: URL(string: "https://images.unsplash.com/photo-1541167760496-1628856ab772?q=80&w=1637&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")! )
    }
}
