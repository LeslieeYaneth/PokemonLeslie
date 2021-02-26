//
//  PokemonDetailInteractor.swift
//  pokemonLeslieYaneth
//
//  Created by Lesliee Yaneth on 24/02/21.
//

import PromiseKit

protocol PokemonDetailBusinessLogic {
    func requestPokemonDetail(idPokemon: String)
}

protocol PokemonDetailDataStore {
    var pokemonData: OnPokemonDetail? { get set }
}

class PokemonDetailInteractor: PokemonDetailBusinessLogic, PokemonDetailDataStore {
    // MARK: Properties
    internal var presenter: PokemonDetailPresentationLogic?
    private let worker = PokemonWorker()
    var pokemonData: OnPokemonDetail?
    
    // MARK: - Business Logic
    func requestPokemonDetail(idPokemon: String) {
        worker.getDetailPokemon(id: idPokemon).done { pokemon in
            self.pokemonData = pokemon
            let response = PokemonDetail.GetPokemonDetail.Response(error: nil)
            self.presenter?.presentPokemonDetail(response)
        }.catch { error in
            let response = PokemonDetail.GetPokemonDetail.Response(error: error)
            self.presenter?.presentPokemonDetail(response)
        }
    }
}
