//
//  PokemonDetailModels.swift
//  Pokedex
//
//  Created by Haurimton Martin on 9/22/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum PokemonDetail {
    
    struct Pokemon: Codable {
        let id: Int
        let name: String
    }
    
    
    // MARK: Use cases
    
    enum GetDetails {
        struct Request { }
        
        struct Response {
            let pokemon: Pokemon
        }
       
        struct ViewModel {
            let pokemon: Pokemon
        }
    }
    
}
