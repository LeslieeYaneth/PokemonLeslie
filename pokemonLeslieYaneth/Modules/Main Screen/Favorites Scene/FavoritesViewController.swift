//
//  FavoritesViewController.swift
//  pokemonLeslieYaneth
//
//  Created by Lesliee Yaneth on 24/02/21.
//

import UIKit
import CoreData

protocol FavoritesDisplayLogic: class {
}

class FavoritesViewController: BaseViewController {

    // MARK: - Properties
    internal var interactor: (FavoritesBusinessLogic & FavoritesDataStore)?
    internal var router: (NSObjectProtocol & FavoritesRoutingLogic & FavoritesDataPassing)?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    var favorite = [Favorites]()

    // MARK: - Setup
    override func setup() {
        let viewController = self
        let interactor = FavoritesInteractor()
        let presenter = FavoritesPresenter()
        let router = FavoritesRouter()
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
    }

    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
        allPokemon()
    }

    @IBAction func closedPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    func allPokemon() {
        do {
            favorite =  try context.fetch(Favorites.fetchRequest())
            tableView.reloadData()
        }
        catch {
            showAlert(msg: "Por el momento no es posible consultar tus pokemones favoritos.")
        }
    }

    func showAlert(msg: String) {
        let alert = UIAlertController(title: "Atención", message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
// MARK: - Display Logic Methods
extension FavoritesViewController: FavoritesDisplayLogic {
}

// MARK: - Table View Methods
extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorite.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonFavoriteC", for: indexPath) as? PokemonFavoriteCell
        cell!.nameLbl.text = favorite[indexPath.row].namePokemon
        cell!.iconImg.kf.setImage(with: favorite[indexPath.row].imagePokemon!.convertStringToURL())
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
