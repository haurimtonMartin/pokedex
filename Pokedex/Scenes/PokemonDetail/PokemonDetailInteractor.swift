//
//  PokemonDetailInteractor.swift
//  Pokedex
//
//  Created by Haurimton Martin on 9/22/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PokemonDetailBusinessLogic {
    func getPokemonDetails(request: PokemonDetail.GetDetails.Request)
}

protocol PokemonDetailDataStore {
    var name: String { get set }
}

class PokemonDetailInteractor: PokemonDetailBusinessLogic, PokemonDetailDataStore {
    
    // MARK: - Properties
    
    var presenter: PokemonDetailPresentationLogic?
    var worker: PokemonDetailWorker?
    var name: String = ""
    
    // MARK: - Get Pokemon Details
    
    func getPokemonDetails(request: PokemonDetail.GetDetails.Request) {
        worker = PokemonDetailWorker()
        worker?.getPokemonDetail(name: name, completionHandler: { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .failure(let error):
                print(error)
            case .success(let pokemon):
                let response = PokemonDetail.GetDetails.Response(pokemon: pokemon)
                strongSelf.presenter?.presentPokemonDetail(response: response)
            }
        })
    }
    
}
