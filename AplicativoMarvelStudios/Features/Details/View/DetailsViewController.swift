//
//  DetailsViewController.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

import UIKit

// MARK: - Protocol
@MainActor
protocol DetailsViewControllerDisplay: AnyObject {
    func getResultDataPerson(data: HeroesModel)
    func showLoading()
    func hideLoading()
    func showResultAlertError(title: String, message: String)
}

// MARK: - DetailsViewController
@MainActor
final class DetailsViewController: UIViewController {
    
    // MARK: - Properties
    
    typealias Dependencies = HasDesignSystemComponentsInterface
    private let dependencies: Dependencies
    
    private let screen: DetailsScreen
    private let interactor: DetailsInteracting
    var personListImage: [HeroesModel] = [] {
        didSet {
            screen.collectionView.reloadData()
            screen.hideLoading()
        }
    }
    var idPerson: Int?
    
    //MARK: - Init
    
    init(interactor: DetailsInteracting, dependencies: Dependencies = DependencyContainer()) {
        self.interactor = interactor
        self.dependencies = dependencies
        self.screen = DetailsScreen(dependencies: dependencies)
        super.init(nibName: nil, bundle: nil)
        screen.delegate = self
        screen.configCollectionView(delegate: self, dataSource: self)
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
        guard let idPerson = idPerson else { return }
        screen.showLoading()
        interactor.fetchDetailsPerson(idPerson: idPerson)
    }
    
    //MARK: - Outhe Methods
    
    func shufflePersonImages(){
        personListImage = personListImage.shuffled()
    }
}

// MARK: - DisplayDetailsViewController

extension DetailsViewController: DetailsViewControllerDisplay {
    
    func getResultDataPerson(data: HeroesModel) {
        screen.setupView(data: data)
        shufflePersonImages()
    }
    
    func showResultAlertError(title: String, message: String) {
        getAlertController(title: title, message: message)
    }
    
    func showLoading() {
        screen.showLoading()
    }
    
    func hideLoading() {
        screen.hideLoading()
    }
}

//MARK: - DetailsViewProtocol
extension DetailsViewController: DetailsViewProtocol{
    func actionFavoritesSave() {
    }
    
    func actionBack() {
        interactor.navigateBack()
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension DetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        personListImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCharactersCollectionViewCell.identifier, for: indexPath) as? ListCharactersCollectionViewCell
        let hero = personListImage[indexPath.row]
//        cell?.setupCell(data: hero)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let largura: CGFloat = 120
        let altura = collectionView.bounds.height - 10
        return CGSize(width: largura, height: altura)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let idPerson = personListImage[indexPath.row]
        interactor.updateDetails(id: idPerson, data: self.personListImage)
    }
}
