//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Haurimton Martin on 9/22/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Kingfisher
import UIKit

protocol PokemonDetailDisplayLogic: AnyObject {
    func displayPokemonDetails(viewModel: PokemonDetail.GetDetails.ViewModel)
}

class PokemonDetailViewController: UIViewController, PokemonDetailDisplayLogic {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Properties
    
    var interactor: PokemonDetailBusinessLogic?
    var router: (NSObjectProtocol & PokemonDetailRoutingLogic & PokemonDetailDataPassing)?
    
    // MARK: - Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        let viewController = self
        let interactor = PokemonDetailInteractor()
        let presenter = PokemonDetailPresenter()
        let router = PokemonDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDetails()
    }
    
    // MARK: - Get Details
    
    private func getDetails() {
        let request = PokemonDetail.GetDetails.Request()
        interactor?.getPokemonDetails(request: request)
    }
    
    func displayPokemonDetails(viewModel: PokemonDetail.GetDetails.ViewModel) {
        let pokemon = viewModel.pokemon
        let imageURL = URL(string: String(format: "https://www.pkparaiso.com/imagenes/pokedex/pokemon/%03d.png", pokemon.id))
        let imagePlaceholder = #imageLiteral(resourceName: "PokeBall")
        imageView.kf.setImage(with: imageURL, placeholder: imagePlaceholder)
        nameLabel.text = pokemon.name
    }
    
}
