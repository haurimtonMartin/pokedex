//
//  PokemonDetailPresenter.swift
//  Pokedex
//
//  Created by Haurimton Martin on 9/22/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PokemonDetailPresentationLogic {
    func presentPokemonDetail(response: PokemonDetail.GetDetails.Response)
}

class PokemonDetailPresenter: PokemonDetailPresentationLogic {
    
    // MARK: - Properties
    
    weak var viewController: PokemonDetailDisplayLogic?
    
    // MARK: - Pokemon Details
    
    func presentPokemonDetail(response: PokemonDetail.GetDetails.Response) {
        let pokemon = response.pokemon
        let viewModel = PokemonDetail.GetDetails.ViewModel(pokemon: pokemon)
        viewController?.displayPokemonDetails(viewModel: viewModel)
    }
    
}
