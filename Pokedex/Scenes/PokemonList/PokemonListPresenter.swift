//
//  PokemonListPresenter.swift
//  Pokedex
//
//  Created by Haurimton Martin on 9/16/21.
//  Copyright (c) 2021 Haurimton Martin. All rights reserved.
//

import UIKit

protocol PokemonListPresentationLogic {
    func presentPokemonList(response: PokemonList.GetPokemonListItems.Response)
}

class PokemonListPresenter: PokemonListPresentationLogic {
    
    // MARK: - Properties
    
    weak var viewController: PokemonListDisplayLogic?
    
    // MARK: - Present Pokemon List
    
    func presentPokemonList(response: PokemonList.GetPokemonListItems.Response) {
        let viewModel = PokemonList.GetPokemonListItems.ViewModel(pokemons: response.results)
        viewController?.displayPokemonList(viewModel: viewModel)
    }
    
}
