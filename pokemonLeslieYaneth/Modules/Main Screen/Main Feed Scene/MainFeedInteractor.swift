//
//  MainFeedInteractor.swift
//  pokemonLeslieYaneth
//
//  Created by Lesliee Yaneth on 24/02/21.
//

import PromiseKit

protocol MainFeedBusinessLogic {
    func requestAllPokemon()
}

protocol MainFeedDataStore {
    var pokemonData: [OnPokemonData] { get set }
    var selectedPokemon: String? { get set }
}

class MainFeedInteractor: MainFeedBusinessLogic, MainFeedDataStore {
    // MARK: Properties
    internal var presenter: MainFeedPresentationLogic?
    private let worker = PokemonWorker()
    internal var pokemonData = [OnPokemonData]()
    var selectedPokemon: String?

    // MARK: - Business Logic
    func requestAllPokemon() {
        worker.getAllData().done { data in
            self.pokemonData = data
            let response = MainFeed.GetPokemon.Response(error: nil)
            self.presenter?.presentPokemon(response)
        }.catch { error in
            let response = MainFeed.GetPokemon.Response(error: error)
            self.presenter?.presentPokemon(response)
        }
    }
}
