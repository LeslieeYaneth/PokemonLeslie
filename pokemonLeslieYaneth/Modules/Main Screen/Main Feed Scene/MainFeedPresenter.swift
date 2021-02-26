//
//  MainFeedPresenter.swift
//  pokemonLeslieYaneth
//
//  Created by Lesliee Yaneth on 24/02/21.
//

import UIKit

protocol MainFeedPresentationLogic {
    func presentPokemon(_ response: MainFeed.GetPokemon.Response)
}

class MainFeedPresenter: MainFeedPresentationLogic {
    // MARK: - Properties
    weak var viewController: MainFeedDisplayLogic?

    // MARK: - Presentation Logic
    func presentPokemon(_ response: MainFeed.GetPokemon.Response) {
        let viewModel = MainFeed.GetPokemon.ViewModel(errorMessage: response.error?.localizedDescription)
        viewController?.displayPokemon(viewModel)
    }
}
