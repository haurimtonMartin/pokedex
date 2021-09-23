//
//  PokemonListModels.swift
//  Pokedex
//
//  Created by Haurimton Martin on 9/16/21.
//  Copyright (c) 2021 Haurimton Martin. All rights reserved.
//

import UIKit

enum PokemonList {
    
    struct PokemonListItem: Codable {
        let name: String
        let url: String
        var number: Int {
            return Int(url.components(separatedBy: "/").filter({ !$0.isEmpty }).last ?? "0") ?? 0
        }
    }
    
    // MARK: Use cases
    
    enum GetPokemonListItems {
        
        struct Request {
            let pageLimit: Int
        }
        
        struct Response: Codable {
            let results: Array<PokemonListItem>
        }
        
        struct ViewModel {
            let pokemons: Array<PokemonListItem>
        }
        
    }
    
}
