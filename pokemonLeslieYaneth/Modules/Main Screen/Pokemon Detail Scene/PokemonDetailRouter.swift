//
//  PokemonDetailRouter.swift
//  pokemonLeslieYaneth
//
//  Created by Lesliee Yaneth on 24/02/21.
//

import UIKit
import SwiftyJSON

protocol PokemonDetailRoutingLogic {
}

protocol PokemonDetailDataPassing {
    var dataStore: PokemonDetailDataStore? { get }
}

class PokemonDetailRouter: NSObject, PokemonDetailRoutingLogic, PokemonDetailDataPassing {
    // MARK: Properties
    weak var viewController: PokemonDetailViewController?
    var dataStore: PokemonDetailDataStore?
    // MARK: Routing Logic
    
}

