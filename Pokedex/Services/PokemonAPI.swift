//
//  PokemonAPI.swift
//  Pokedex
//
//  Created by Haurimton Martin on 9/16/21.
//

import Combine
import Foundation

enum PokemonStoreResult<T> {
    case failure(error: Error)
    case success(result: T)
}

typealias PokemonStoreGetPokemonListCompletionHandler = (PokemonStoreResult<PokemonList.GetPokemonListItems.Response>) -> ()
typealias PokemonDetailCompletionHandler = (PokemonStoreResult<PokemonDetail.Pokemon>) -> ()

protocol PokemonStoreProtocol: AnyObject {
    func getPokemonList(limit: Int, completionHandler: @escaping PokemonStoreGetPokemonListCompletionHandler)
    func getPokemonDetail(name: String, completionHandler: @escaping PokemonDetailCompletionHandler)
}

class PokemonAPI: PokemonStoreProtocol {
    
    // MARK: - Constants
    
    private let networkController: NetworkControllerProtocol
    
    // MARK: - Properties
    
    private var subscriptions: Set<AnyCancellable> = Set<AnyCancellable>()
    
    // MARK: - Init
    
    init(networkController: NetworkControllerProtocol = NetworkController()) {
        self.networkController = networkController
    }
    
    // MARK: - Get Pokemon List
    
    func getPokemonList(limit: Int, completionHandler: @escaping PokemonStoreGetPokemonListCompletionHandler) {
        let queryItems = [
            URLQueryItem(name: Constants.URLQueryItem.pageLimit, value: String(limit))
        ]
        let endpoint = Endpoint(api: .pokeApi, path: Constants.URL.PokeAPI.pokemonList, queryItems: queryItems)
        networkController.get(api: endpoint.api, type: PokemonList.GetPokemonListItems.Response.self, url: endpoint.url)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    completionHandler(.failure(error: error))
                case .finished:
                    break
                }
            }, receiveValue: { response in
                completionHandler(.success(result: response))
            })
            .store(in: &subscriptions)
    }
    
    // MARK: - Get Pokemon Detail
    
    func getPokemonDetail(name: String, completionHandler: @escaping PokemonDetailCompletionHandler) {
        let path = String(format: Constants.URL.PokeAPI.pokemonDetails, name)
        let endpoint = Endpoint(api: .pokeApi, path: path)
        networkController.get(api: endpoint.api, type: PokemonDetail.Pokemon.self, url: endpoint.url)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    completionHandler(.failure(error: error))
                case .finished:
                    break
                }
            }, receiveValue: { pokemon in
                completionHandler(.success(result: pokemon))
            })
            .store(in: &subscriptions)
    }
    
}
