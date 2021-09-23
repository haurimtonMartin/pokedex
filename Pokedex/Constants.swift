//
//  Constants.swift
//  Pokedex
//
//  Created by Haurimton Martin on 9/16/21.
//

import Foundation

struct Constants {
    
    struct URL {
        struct PokeAPI {
            static let host = "pokeapi.co"
            static let pokemonDetails = "/api/v2/pokemon/%@"
            static let pokemonList = "/api/v2/pokemon"
        }
    }
    
    struct URLQueryItem {
        static let pageLimit = "limit"
    }
    
}
