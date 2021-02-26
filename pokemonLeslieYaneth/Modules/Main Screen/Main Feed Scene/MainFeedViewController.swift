//
//  MainFeedViewController.swift
//  pokemonLeslieYaneth
//
//  Created by Lesliee Yaneth on 24/02/21.
//

import UIKit

protocol MainFeedDisplayLogic: class {
    func displayPokemon(_ viewModel: MainFeed.GetPokemon.ViewModel)
}

class MainFeedViewController: BaseViewController {

    // MARK: - Properties
    internal var interactor: (MainFeedBusinessLogic & MainFeedDataStore)?
    internal var router: (NSObjectProtocol & MainFeedRoutingLogic & MainFeedDataPassing)?
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Setup
    override func setup() {
        let viewController = self
        let interactor = MainFeedInteractor()
        let presenter = MainFeedPresenter()
        let router = MainFeedRouter()
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
        if UserDefaults.standard.string(forKey: Key.KMyKey) != nil {

        } else {
            UserDefaults.standard.set("User", forKey: Key.KMyKey)
            UserDefaults.standard.synchronize()
        }
        interactor!.requestAllPokemon()
    }

    @IBAction func showFavoritesPressed(_ sender: Any) {
        router!.routeToFavorite()
    }
    
    func showAlert(msg: String) {
        let alert = UIAlertController(title: "Atención", message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Display Logic Methods
extension MainFeedViewController: MainFeedDisplayLogic {
    func displayPokemon(_ viewModel: MainFeed.GetPokemon.ViewModel) {
        if let msg = viewModel.errorMessage {
            showAlert(msg: msg)
        } else {
            tableView.reloadData()
        }
    }
}

// MARK: - Table View Methods
extension MainFeedViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor!.pokemonData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonC", for: indexPath) as? PokemonCell
        cell!.nameLbl.text = interactor!.pokemonData[indexPath.row].name
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var id = interactor!.pokemonData[indexPath.row].url
        if id!.count > 0 {
            id!.removeFirst(34)
        }
        interactor!.selectedPokemon = id
        router!.routeToDetail()
    }
}
