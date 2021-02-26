//
//  PokemonModels.swift
//  pokemonLeslieYaneth
//
//  Created by Lesliee Yaneth on 24/02/21.
//

import Foundation
import SwiftyJSON

protocol OnPokemon {
    // MARK: Properties
    var name: String! { get }
    var url: String! { get }
}

struct OnPokemonData: OnPokemon {
    // MARK: Properties
    let name: String!
    let url: String!

    // MARK: - Init
    init(fromJSON json: JSON) {
        name = json["name"].stringValue
        url = json["url"].stringValue
    }
}

struct OnPokemonDetail {
    // MARK: Properties
    let name: String!
    let img: String!

    // MARK: - Init
    init(fromJSON json: JSON) {
        name = json["pokemon"]["name"].stringValue
        img = json["sprites"]["front_default"].stringValue
    }
}

struct Key {
    static let KMyKey = "MY_KEY"
}
