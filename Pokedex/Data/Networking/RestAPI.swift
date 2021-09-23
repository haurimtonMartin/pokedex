//
//  RestAPI.swift
//  Pokedex
//
//  Created by Haurimton Martin on 9/16/21.
//

import Foundation

enum URLScheme: String {
    case http
    case https
}

struct RestAPI {
    let host: String
    let scheme: URLScheme
}

extension RestAPI {
    static var pokeApi: RestAPI {
        let baseUrl = Constants.URL.PokeAPI.host
        return RestAPI(host: baseUrl, scheme: .https)
    }
}
