//
//  StringExtensions.swift
//  pokemonLeslieYaneth
//
//  Created by Lesliee Yaneth on 24/02/21.
//

import UIKit

extension String {
    func convertStringToURL() -> URL? {
        guard let formStr = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return nil }
        guard let daUrl = URL(string: formStr) else { return nil }
        return daUrl
    }
}
