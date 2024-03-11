//
//  Agent.swift
//  NeomCodeChallenge
//
//  Created by Nawaf AlMuaither on 11/03/2024.
//

import Foundation
import Combine

struct Agent {
    func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<T, Error> {
        Logger.shared.logRequest(url: request.url, method: request.httpMethod, body: request.httpBody, headers: request.allHTTPHeaderFields)
        
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { output -> Data in
                guard let httpResponse = output.response as? HTTPURLResponse else {
                    throw URLError(.badServerResponse)
                }
                Logger.shared.logResponse(url: request.url, statusCode: httpResponse.statusCode, response: output.data, error: nil)
                return output.data
            }
            .mapError { error -> Error in
                Logger.shared.logResponse(url: request.url, statusCode: 0, response: nil, error: error)
                return error
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
