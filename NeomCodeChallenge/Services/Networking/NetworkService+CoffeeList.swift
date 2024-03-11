//
//  NetworkService+CoffeeList.swift
//  NeomCodeChallenge
//
//  Created by Nawaf AlMuaither on 11/03/2024.
//

import Foundation
import Combine

extension NetworkService {
    static func coffeeList() -> AnyPublisher<[Coffee], Error> {
        let request = URLComponents(url: base.appendingPathComponent(EndPoints.hotCoffeeList.rawValue), resolvingAgainstBaseURL: true)?
            .request
        return agent.run(request!)
    }
}
