//
//  ViewController.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

// MARK: - Protocol
@MainActor
protocol HomeViewDisplay: AnyObject {
    func displayCharacters(_ characters: [RMCharacter])
    func showAlertError(title: String, message: String)
    func showLoading()
    func hideLoading()
}

// MARK: - HomeViewController
@MainActor
final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    typealias Dependencies = HasDesignSystemComponentsInterface
    private let dependencies: Dependencies
    private let screen: HomeScreen
    let interactor: HomeInteracting
    
    private var characters: [RMCharacter] = [] {
        didSet {
            screen.hideLoading()
            screen.tableView.reloadData()
        }
    }
    
    var presenter: LeakedPresenter? = LeakedPresenter() // só para testes de leak
    
    // MARK: - Init
    init(interactor: HomeInteracting, dependencies: Dependencies = DependencyContainer()) {
        self.interactor = interactor
        self.dependencies = dependencies
        self.screen = HomeScreen(dependencies: dependencies)
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
        interactor.fetchChracters()
        presenter = nil
    }
}

// MARK: - HomeViewDisplay
extension HomeViewController: HomeViewDisplay {
    
    func displayCharacters(_ characters: [RMCharacter]) {
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

// MARK: - UITableViewDelegate, UITableViewDataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PersonListTableViewCell? = tableView.dequeueReusableCell(
            withIdentifier: PersonListTableViewCell.identifier,
            for: indexPath
        ) as? PersonListTableViewCell
        let character = characters[indexPath.row]
        cell?.setupCell(data: character)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = characters[indexPath.row]
        interactor.navigateToDetail(character: character)
    }
}
