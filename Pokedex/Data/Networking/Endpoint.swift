//
//  Endpoint.swift
//  Pokedex
//
//  Created by Haurimton Martin on 9/16/21.
//

import Foundation

struct Endpoint {
    var api: RestAPI
    var path: String
    var queryItems: Array<URLQueryItem> = []
    
    init(api: RestAPI, path: String, queryItems: Array<URLQueryItem> = []) {
        self.api = api
        self.path = path
        self.queryItems = queryItems
    }
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = api.scheme.rawValue
        components.host = api.host
        components.path = path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
}
