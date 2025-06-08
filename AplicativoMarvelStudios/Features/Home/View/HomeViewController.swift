//
//  ViewController.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

// MARK: - Protocol

protocol HomeViewDisplay: AnyObject{
    func displayCharacters(_ characters: [HeroesModel])
    func showAlertError(title: String, message: String)
    func showLoading()
    func hideLoading()
}

// MARK: - HomeViewController

final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    private var screen: HomeScreen?
    var interactor: HomeInteracting?
    private var characters: [HeroesModel] = []
    
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
    }
}

// MARK: - HomeViewDisplay

extension HomeViewController: HomeViewDisplay {
 
    func displayCharacters(_ characters: [HeroesModel]) {
        self.characters = characters
        DispatchQueue.main.async {
            self.screen?.hideLoading()
            self.screen?.tableView.reloadData()
        }
    }
    
    func showAlertError(title: String, message: String) {
        getAlertController(title: title, message: message)
    }
    
    func showLoading() {
        DispatchQueue.main.async {
            self.screen?.showLoading()
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.screen?.hideLoading()
        }
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
        interactor?.navigateToDetail(data: self.characters)
    }
    
}
