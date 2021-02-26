//
//  PokemonAPI.swift
//  pokemonLeslieYaneth
//
//  Created by Lesliee Yaneth on 24/02/21.
//

import Foundation
import CoreLocation
import Alamofire

enum PokemonAPI {
    case allData
    case detailPokemon(idPokemon: String)
}

// MARK: - Endpoint Declaration
extension PokemonAPI: APIEndpoint {

    var baseURL: String! {
        switch self {

        default:
            return PokemonURLS.restURL
        }
    }

    var path: String! {
        switch self {
        case .allData:
            return "pokemon?limit=100&offset=100"

        case .detailPokemon(let idPokemon):
            return "pokemon-form/\(idPokemon)"
        }
    }

    var method: HTTPMethod! {
        switch self {

        default:
            return .get
        }
    }

    var headers: HTTPHeaders! {
        return ["X-Authorization": PokemonURLS.apiKey]
    }

    var parameters: [String: Any]? {
        switch self {

        default:
            return nil
        }
    }

    var parameterEncoding: ParameterEncoding! {
        return URLEncoding.default
    }
}

