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
    
    typealias Dependencies = HasDesignSystemComponentsInterface
    private let dependencies: Dependencies
    private let screen: HomeScreen
    let interactor: HomeInteracting
    
    private var characters: [HeroesModel] = [] {
        didSet {
            screen.hideLoading()
            screen.tableView.reloadData()
        }
    }
    var presenter: LeakedPresenter? = LeakedPresenter() // metodo para da Leaks forcado e aprender usar o instruments
    
    // MARK: - Init
    
    init(interactor: HomeInteracting, dependencies: Dependencies = DependencyContainer() ){
        self.interactor = interactor
        self.dependencies = dependencies
        self.screen = HomeScreen(components: dependencies.designSystemComponents)
        super.init(nibName: nil, bundle: nil)
        screen.configTableView(delegate: self, dataSource: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen.showLoading()
        interactor.fetchHeroes()
        presenter = nil // metodo para da Leaks forcado e aprender usar o instruments
    }
}

// MARK: - HomeViewDisplay

extension HomeViewController: HomeViewDisplay {
    
    func displayCharacters(_ characters: [HeroesModel]) {
        self.characters = characters
    }
    
    func showAlertError(title: String, message: String) {
        getAlertController(title: title, message: message)
    }
    
    func showLoading() {
        screen.showLoading()
    }
    
    func hideLoading() {
        screen.hideLoading()
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
        interactor.navigateToDetail(data: self.characters, idPerson: idPerson)
    }
    
}
