//
//  PokemonListWorker.swift
//  Pokedex
//
//  Created by Haurimton Martin on 9/16/21.
//  Copyright (c) 2021 Haurimton Martin. All rights reserved.
//

import UIKit

struct PokemonListWorker {
    
    // MARK: - Constants
    
    private let pokemonStore: PokemonStoreProtocol
    
    // MARK: - Init
    
    init(pokemonStore: PokemonStoreProtocol = PokemonAPI()) {
        self.pokemonStore = pokemonStore
    }
    
    func getPokemonList(limit: Int, completionHandler: @escaping(Result<PokemonList.GetPokemonListItems.Response, Error>) -> Void) {
        pokemonStore.getPokemonList(limit: limit) { result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    completionHandler(.failure(error))
                case .success(let pokemonList):
                    completionHandler(.success(pokemonList))
                }
            }
        }
    }
    
}
