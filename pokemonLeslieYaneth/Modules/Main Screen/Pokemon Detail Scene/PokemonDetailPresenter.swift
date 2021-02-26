//
//  PokemonDetailPresenter.swift
//  pokemonLeslieYaneth
//
//  Created by Lesliee Yaneth on 24/02/21.
//

import UIKit

protocol PokemonDetailPresentationLogic {
    func presentPokemonDetail(_ response: PokemonDetail.GetPokemonDetail.Response)
}

class PokemonDetailPresenter: PokemonDetailPresentationLogic {
    // MARK: - Properties
    weak var viewController: PokemonDetailDisplayLogic?

    // MARK: - Presentation Logic
    func presentPokemonDetail(_ response: PokemonDetail.GetPokemonDetail.Response) {
        let viewModel = PokemonDetail.GetPokemonDetail.ViewModel(errorMessage: response.error?.localizedDescription)
        viewController?.displayPokemonDetail(viewModel)
    }
}
