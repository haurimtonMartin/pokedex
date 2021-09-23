//
//  PokemonListItemTableViewCell.swift
//  Pokedex
//
//  Created by Haurimton Martin on 9/20/21.
//

import Kingfisher
import UIKit

class PokemonListItemTableViewCell: UITableViewCell {
    
    // MARK: - Views
    
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: - Awake from Nib
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Prepare for Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.image = nil
        titleLabel.text = nil
    }
    
    // MARK: - Set Pokemon List Item
    
    func set(pokemon: PokemonList.PokemonListItem) {
        let imageUrlString = String(format: "https://www.pkparaiso.com/imagenes/pokedex/pokemon/%03d.png", pokemon.number)
        thumbnailImageView.kf.setImage(with: URL(string: imageUrlString), placeholder: #imageLiteral(resourceName: "PokeBall"))
        titleLabel.text = pokemon.name
    }
    
}
