//
//  PokemonDetailWorker.swift
//  Pokedex
//
//  Created by Haurimton Martin on 9/22/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class PokemonDetailWorker {
    
    // MARK: - Private Constants
    
    private let pokemonStore: PokemonStoreProtocol
    
    // MARK: - Object Lifecycle
    
    init(pokemonStore: PokemonStoreProtocol = PokemonAPI()) {
        self.pokemonStore = pokemonStore
    }
    
    // MARK: - Get Detail
    
    func getPokemonDetail(name: String, completionHandler: @escaping PokemonDetailCompletionHandler) {
        pokemonStore.getPokemonDetail(name: name) { result in
            DispatchQueue.main.async {
                completionHandler(result)
            }
        }
    }
    
}
