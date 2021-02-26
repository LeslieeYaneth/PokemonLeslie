//
//  PokemonWorker.swift
//  pokemonLeslieYaneth
//
//  Created by Lesliee Yaneth on 24/02/21.
//

import UIKit
import Alamofire
import PromiseKit
import SwiftyJSON

class PokemonWorker {
    // MARK: - Properties
    private let backQueue = DispatchQueue.global(qos: .userInitiated)

    // MARK: - Public Methods
    func getAllData() -> Promise<[OnPokemonData]> {
        let request = NetworkManager.request(endpoint: PokemonAPI.allData)
        return request.then(on: backQueue) { json -> Promise<[OnPokemonData]> in
            var ordersArray = [OnPokemonData]()
            for (_, element) in json["results"] {
                ordersArray.append(OnPokemonData(fromJSON: element))
            }
            return .value(ordersArray)
        }
    }

    func getDetailPokemon(id: String)-> Promise<OnPokemonDetail> {
        let request = NetworkManager.request(endpoint: PokemonAPI.detailPokemon(idPokemon: id))
        return request.then(on: backQueue) { json in
            return Promise { seal in
                seal.fulfill(OnPokemonDetail(fromJSON: json))
            }
        }
    }
}
