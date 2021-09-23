//
//  PokemonListRouter.swift
//  Pokedex
//
//  Created by Haurimton Martin on 9/16/21.
//  Copyright (c) 2021 Haurimton Martin. All rights reserved.
//

import UIKit

@objc protocol PokemonListRoutingLogic {
    func routeToDetail(name: String)
}

protocol PokemonListDataPassing {
    var dataStore: PokemonListDataStore? { get }
}

class PokemonListRouter: NSObject, PokemonListRoutingLogic, PokemonListDataPassing {
    
    // MARK: - Properties
    
    weak var viewController: PokemonListViewController?
    var dataStore: PokemonListDataStore?
    
    // MARK: - Routing
    
    func routeToDetail(name: String) {
        let detailViewController = PokemonDetailViewController(nibName: String(describing: PokemonDetailViewController.self), bundle: nil)
        var detailDataStore = detailViewController.router?.dataStore
        detailDataStore?.name = name
        viewController?.navigationController?.show(detailViewController, sender: nil)
    }
    
}
