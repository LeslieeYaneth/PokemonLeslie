//
//  MainFeedUseCases.swift
//  pokemonLeslieYaneth
//
//  Created by Lesliee Yaneth on 24/02/21.
//

import UIKit

enum MainFeed {
    struct GetPokemon {
        struct Response {
            let error: Error?
        }

        struct ViewModel {
            let errorMessage: String?
        }
    }
}
