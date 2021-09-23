//
//  PokemonListResultsTableViewController.swift
//  Pokedex
//
//  Created by Haurimton Martin on 9/20/21.
//

import UIKit

class PokemonListResultsTableViewController: UITableViewController {
    
    // MARK: - Private Constants
    
    private let pokemonListItemCellIdentifier = String(describing: PokemonListItemTableViewCell.self)
    
    // MARK: - Properties
    
    var dataSource = PokemonListDataSource()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pokemonListItemCellNib = UINib(nibName: String(describing: PokemonListItemTableViewCell.self), bundle: nil)
        tableView.register(pokemonListItemCellNib, forCellReuseIdentifier: pokemonListItemCellIdentifier)
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
    }
    
}
