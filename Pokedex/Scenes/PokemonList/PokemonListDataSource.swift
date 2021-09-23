//
//  PokemonListDataSource.swift
//  Pokedex
//
//  Created by Haurimton Martin on 9/22/21.
//

import UIKit

class PokemonListDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Properties
    
    var items: Array<PokemonList.PokemonListItem> = []
    
    // MARK: - Callbacks
    
    typealias PokemonSelectionBlock = (PokemonList.PokemonListItem) -> ()
    var onSelectPokemon: PokemonSelectionBlock?
    
    // MARK: - Number of Rows in Section
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // MARK: - Cell for Row at
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PokemonListItemTableViewCell.self), for: indexPath) as? PokemonListItemTableViewCell else { return UITableViewCell() }
        let pokemon = items[indexPath.row]
        cell.set(pokemon: pokemon)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon = items[indexPath.row]
        onSelectPokemon?(pokemon)
    }
    
}
