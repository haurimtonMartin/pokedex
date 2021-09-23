//
//  PokemonDetailRouter.swift
//  Pokedex
//
//  Created by Haurimton Martin on 9/22/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol PokemonDetailRoutingLogic { }

protocol PokemonDetailDataPassing {
    var dataStore: PokemonDetailDataStore? { get }
}

class PokemonDetailRouter: NSObject, PokemonDetailRoutingLogic, PokemonDetailDataPassing {
    
    // MARK: - Properties
    
    weak var viewController: PokemonDetailViewController?
    var dataStore: PokemonDetailDataStore?
    
}
