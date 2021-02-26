//
//  MainFeedRouter.swift
//  pokemonLeslieYaneth
//
//  Created by Lesliee Yaneth on 24/02/21.
//

import UIKit
import SwiftyJSON

protocol MainFeedRoutingLogic {
    func routeToDetail()
    func routeToFavorite()
}

protocol MainFeedDataPassing {
    var dataStore: MainFeedDataStore? { get }
}

class MainFeedRouter: NSObject, MainFeedRoutingLogic, MainFeedDataPassing {
    // MARK: Properties
    weak var viewController: MainFeedViewController?
    var dataStore: MainFeedDataStore?
    // MARK: Routing Logic

    func routeToDetail() {
        guard let viewC = viewController else { return }
        let destination = UIStoryboard.main.instantiateViewController(withIdentifier: "PokemonDetailVC") as? PokemonDetailViewController
        destination!.idPokemon = (dataStore?.selectedPokemon)!
        destination!.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        viewC.present(destination!, animated: true, completion: nil)
   }

    func routeToFavorite() {
        guard let viewC = viewController else { return }
        let destination = UIStoryboard.main.instantiateViewController(withIdentifier: "FavoritesVC") as? FavoritesViewController
        destination!.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        viewC.present(destination!, animated: true, completion: nil)
   }
}
