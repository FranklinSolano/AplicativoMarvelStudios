//
//  ViewController.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

// MARK: - Protocol

protocol HomeViewDisplay: AnyObject{
    func displayHeroes(heroes: [HomeModel])
}

// MARK: - HomeViewController

final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    private var screen: HomeScreen?
    private var heroes: [HomeModel] = []
    var interactor: HomeInteracting?
    
    // MARK: - Lifecycle
    
    override func loadView() {
        screen = HomeScreen()
        screen?.configTableView(delegate: self, dataSource: self)
        view = screen
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchHeroes()
        if interactor == nil {
            print("banana") 
         }
    }
}

// MARK: - HomeViewDisplay

extension HomeViewController: HomeViewDisplay {
    func displayHeroes(heroes: [HomeModel]) {
        print("Recebeu heroes: \(heroes.count)")
        self.heroes = heroes
        screen?.tableView.reloadData()
    }
    
    
}

// MARK: - UITableViewDelegate,UITableViewDataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PersonListTableViewCell? = tableView.dequeueReusableCell(withIdentifier: PersonListTableViewCell.identifier, for: indexPath) as? PersonListTableViewCell
        let hero = heroes[indexPath.row]
        cell?.setupCell(data: hero)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 150
    }
    
}
