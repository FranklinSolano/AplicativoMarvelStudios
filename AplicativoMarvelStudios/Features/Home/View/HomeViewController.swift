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
        interactor?.fetchHeroes()
    }
}

// MARK: - HomeViewDisplay

extension HomeViewController: HomeViewDisplay {
    func displayCharacters(_ characters: [HeroesModel]) {
        self.characters = characters
        print(characters)
         DispatchQueue.main.async {
             self.screen?.tableView.reloadData()
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
}
