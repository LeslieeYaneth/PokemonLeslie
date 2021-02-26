//
//  FavoritesRouter.swift
//  pokemonLeslieYaneth
//
//  Created by Lesliee Yaneth on 24/02/21.
//

import UIKit

protocol FavoritesRoutingLogic {
}

protocol FavoritesDataPassing {
}

class FavoritesRouter: NSObject, FavoritesRoutingLogic, FavoritesDataPassing {
    // MARK: Properties
    weak var viewController: FavoritesViewController?
    var dataStore: FavoritesDataStore?
    // MARK: Routing Logic
}
