//
//  FavoritesInteractor.swift
//  pokemonLeslieYaneth
//
//  Created by Lesliee Yaneth on 24/02/21.
//

import PromiseKit

protocol FavoritesBusinessLogic {
}

protocol FavoritesDataStore {
}

class FavoritesInteractor: FavoritesBusinessLogic, FavoritesDataStore {
    // MARK: Properties
    internal var presenter: FavoritesPresentationLogic?
    // MARK: - Business Logic
}
