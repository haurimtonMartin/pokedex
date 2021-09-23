//
//  PokemonListViewController.swift
//  Pokedex
//
//  Created by Haurimton Martin on 9/16/21.
//  Copyright (c) 2021 Haurimton Martin. All rights reserved.
//

import UIKit

protocol PokemonListDisplayLogic: AnyObject {
    func displayPokemonList(viewModel: PokemonList.GetPokemonListItems.ViewModel)
}

class PokemonListViewController: UIViewController, PokemonListDisplayLogic {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Views
    
    private var searchController: UISearchController!
    private var resultsTableController: PokemonListResultsTableViewController!
    
    // MARK: - Private Properties
    
    private var dataSource: PokemonListDataSource!
    
    // MARK: - Public Properties
    
    var interactor: PokemonListBusinessLogic?
    var router: (NSObjectProtocol & PokemonListRoutingLogic & PokemonListDataPassing)?
    
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
        let interactor = PokemonListInteractor()
        let presenter = PokemonListPresenter()
        let router = PokemonListRouter()
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
        setupDataSource()
        setupTableView()
        setupSearchResultsController()
        getPokemonList()
    }
    
    // MARK: - Setup DataSource
    
    private func setupDataSource() {
        dataSource = PokemonListDataSource()
        dataSource.onSelectPokemon = { [weak self] pokemon in
            guard let strongSelf = self else { return }
            let name = pokemon.name
            strongSelf.router?.routeToDetail(name: name)
        }
    }
    
    // MARK: - Setup TableView
    
    private func setupTableView() {
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        let pokemonListItemNib = UINib(nibName: String(describing: PokemonListItemTableViewCell.self), bundle: nil)
        tableView.register(pokemonListItemNib, forCellReuseIdentifier: String(describing: PokemonListItemTableViewCell.self))
    }
    
    // MARK: - Setup Search Results Controller
    
    private func setupSearchResultsController() {
        resultsTableController = PokemonListResultsTableViewController(nibName: String(describing: PokemonListResultsTableViewController.self), bundle: nil)
        
        searchController = UISearchController(searchResultsController: resultsTableController)
        searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .none
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
    
    // MARK: - Get Pokemon List
    
    private func getPokemonList() {
        let request = PokemonList.GetPokemonListItems.Request(pageLimit: 151)
        interactor?.getPokemonList(request: request)
    }
    
    func displayPokemonList(viewModel: PokemonList.GetPokemonListItems.ViewModel) {
        dataSource.items = viewModel.pokemons
        tableView.reloadData()
    }
    
}

extension PokemonListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let resultsController = searchController.searchResultsController as? PokemonListResultsTableViewController else { return }
        let whitespaceCharacterSet = CharacterSet.whitespaces
        let strippedString = searchController.searchBar.text!.trimmingCharacters(in: whitespaceCharacterSet)
        resultsController.dataSource.items = dataSource.items.filter({ $0.name.lowercased().contains(strippedString.lowercased()) })
        resultsController.tableView.reloadData()
    }
    
}
