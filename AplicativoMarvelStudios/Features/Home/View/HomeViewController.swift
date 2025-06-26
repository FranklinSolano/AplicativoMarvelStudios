//
//  ViewController.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

// MARK: - Protocol
@MainActor //Garantir que os metodos rode na Thread Principal
protocol HomeViewDisplay: AnyObject{
    func displayCharacters(_ characters: [HeroesModel])
    func showAlertError(title: String, message: String)
    func showLoading()
    func hideLoading()
}

// MARK: - HomeViewController
@MainActor //Garantir que os metodos rode na Thread Principal
final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    private var screen: HomeScreen?
    var interactor: HomeInteracting?
    private var characters: [HeroesModel] = [] {
        didSet {
            screen?.hideLoading()
            screen?.tableView.reloadData()
        }
    }
    var presenter: LeakedPresenter? = LeakedPresenter() // metodo para da Leaks forcado e aprender usar o instruments
    
    // MARK: - Lifecycle
    
    override func loadView() {
        screen = HomeScreen()
        screen?.configTableView(delegate: self, dataSource: self)
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.showLoading()
        interactor?.fetchHeroes()
        presenter = nil // metodo para da Leaks forcado e aprender usar o instruments
    }
}

// MARK: - HomeViewDisplay
@MainActor //Garantir que os metodos rode na Thread Principal
extension HomeViewController: HomeViewDisplay {
    
    func displayCharacters(_ characters: [HeroesModel]) {
        self.characters = characters
    }
    
    func showAlertError(title: String, message: String) {
        getAlertController(title: title, message: message)
    }
    
    func showLoading() {
        screen?.showLoading()
    }
    
    func hideLoading() {
        screen?.hideLoading()
    }
}

// MARK: - UITableViewDelegate,UITableViewDataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PersonListTableViewCell? = tableView.dequeueReusableCell(withIdentifier: PersonListTableViewCell.identifier, for: indexPath) as? PersonListTableViewCell
        let hero = characters[indexPath.row]
        cell?.setupCell(data: hero)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let idPerson = characters[indexPath.row]
        interactor?.navigateToDetail(data: self.characters, idPerson: idPerson)
    }
    
}
