//
//  PokemonListInteractor.swift
//  Pokedex
//
//  Created by Haurimton Martin on 9/16/21.
//  Copyright (c) 2021 Haurimton Martin. All rights reserved.
//

import UIKit

protocol PokemonListBusinessLogic {
    func getPokemonList(request: PokemonList.GetPokemonListItems.Request)
}

protocol PokemonListDataStore { }

class PokemonListInteractor: PokemonListBusinessLogic, PokemonListDataStore {
    
    var presenter: PokemonListPresentationLogic?
    var worker: PokemonListWorker?
    
    // MARK: - Get Pokemon List
    
    func getPokemonList(request: PokemonList.GetPokemonListItems.Request) {
        worker = PokemonListWorker()
        worker?.getPokemonList(limit: request.pageLimit) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .failure(let error):
                print(error)
            case .success(let response):
                strongSelf.presenter?.presentPokemonList(response: response)
            }
        }
    }
    
}
