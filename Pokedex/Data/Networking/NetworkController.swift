//
//  NetworkController.swift
//  Pokedex
//
//  Created by Haurimton Martin on 9/16/21.
//

import Combine
import Foundation

protocol NetworkControllerProtocol {
    func get<T>(api: RestAPI, type: T.Type, url: URL) -> AnyPublisher<T, Error> where T: Codable
}

struct NetworkController: NetworkControllerProtocol {
    
    func get<T>(api: RestAPI, type: T.Type, url: URL) -> AnyPublisher<T, Error> where T : Decodable, T : Encodable {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
