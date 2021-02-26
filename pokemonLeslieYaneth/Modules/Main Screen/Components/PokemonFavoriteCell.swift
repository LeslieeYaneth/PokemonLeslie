//
//  PokemonFavoriteCell.swift
//  pokemonLeslieYaneth
//
//  Created by Lesliee Yaneth on 24/02/21.
//

import UIKit

class PokemonFavoriteCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!

    // MARK: - Object Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 1
    }
}
