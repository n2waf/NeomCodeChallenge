//
//  NetworkService.swift
//  NeomCodeChallenge
//
//  Created by Nawaf AlMuaither on 11/03/2024.
//

import Foundation
import Combine

enum NetworkService {
    private static let base = URL(string: "https://api.sampleapis.com")!
    private static let agent = Agent()
    
    static func coffeeList() -> AnyPublisher<[Coffee], Error> {
        let request = URLComponents(url: base.appendingPathComponent("coffee/hot"), resolvingAgainstBaseURL: true)?
            .request
        return agent.run(request!)
    }
    
}

extension URLComponents {
    var request: URLRequest? {
        url.map { URLRequest.init(url: $0) }
    }
}

