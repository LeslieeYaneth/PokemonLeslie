//
//  PokemonDetailViewController.swift
//  pokemonLeslieYaneth
//
//  Created by Lesliee Yaneth on 24/02/21.
//

import UIKit
import Kingfisher
import CoreData

protocol PokemonDetailDisplayLogic: class {
    func displayPokemonDetail(_ viewModel: PokemonDetail.GetPokemonDetail.ViewModel)
}

class PokemonDetailViewController: BaseViewController {
    // MARK: - Properties
    internal var interactor: (PokemonDetailBusinessLogic & PokemonDetailDataStore)?
    internal var router: (NSObjectProtocol & PokemonDetailRoutingLogic & PokemonDetailDataPassing)?
    var idPokemon = ""
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    // MARK: - Outlets
    @IBOutlet weak var ContainerView: UIView!
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!

    // MARK: - Setup
    override func setup() {
        let viewController = self
        let interactor = PokemonDetailInteractor()
        let presenter = PokemonDetailPresenter()
        let router = PokemonDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        view.isOpaque = false
        interactor!.requestPokemonDetail(idPokemon: idPokemon)
        ContainerView.layer.shadowColor = UIColor.gray.cgColor
        ContainerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        ContainerView.layer.shadowOpacity = 1
        ContainerView.layer.shadowRadius = 1
    }

    @IBAction func closedPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func favoritePressed(_ sender: Any) {
        save()
    }

    func showAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func save() {
        let newFavorite = Favorites(context: context)
        newFavorite.namePokemon = interactor!.pokemonData!.name
        newFavorite.imagePokemon = interactor!.pokemonData!.img
        do {
            try context.save()
            showAlert(title: "Felicidades", msg: "¡" + interactor!.pokemonData!.name + "se volvío tu favorito!")
        }
        catch {
            showAlert(title: "Atención", msg: "No se puedo marcar como favorito, intentalo mas tarde.")
        }
    }
}

// MARK: - Display Logic Methods
extension PokemonDetailViewController: PokemonDetailDisplayLogic {
    func displayPokemonDetail(_ viewModel: PokemonDetail.GetPokemonDetail.ViewModel) {
        if let msg = viewModel.errorMessage {
            showAlert(title: "Atención", msg: msg)
        } else {
            nameLbl.text = interactor!.pokemonData?.name
            iconImg.kf.setImage(with: interactor!.pokemonData?.img.convertStringToURL())
        }
    }
}
