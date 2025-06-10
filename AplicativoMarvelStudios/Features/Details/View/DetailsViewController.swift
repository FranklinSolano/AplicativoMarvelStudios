//
//  DetailsViewController.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

import UIKit

// MARK: - Protocol
protocol DetailsViewControllerDisplay: AnyObject {
    func getResutDataPerson(data: HeroesModel)
    func showLoading()
    func hideLoading()
    func showResultAlertError(title: String, message: String)
}

// MARK: - DetailsViewController

final class DetailsViewController: UIViewController {
    
    // MARK: - Properties
    
    private var screen: DetailsScreen?
    var interactor: DetailsInteracting?
    var personListImage: [HeroesModel] = []
    private var personListImageShuffle: [HeroesModel] = []
    var idPerson: Int?
    
    // MARK: - Lifecycle
    
    override func loadView() {
        screen = DetailsScreen()
        screen?.delegate = self
        screen?.configCollectoinView(delegate: self, dataSource: self)
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let idPerson = idPerson else { return }
        screen?.showLoading()
        interactor?.fetchDetailsPerson(idPerson: idPerson)
        shuffleImage()
    }
    
    //MARK: - Outhe Methods
    
    func shuffleImage(){
        personListImageShuffle = personListImage
        personListImageShuffle.shuffle()
    }
}

// MARK: - DisplayDetailsViewController

extension DetailsViewController: DetailsViewControllerDisplay {
    func showResultAlertError(title: String, message: String) {
        self.getAlertController(title: title, message: message)
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
    
    func getResutDataPerson(data: HeroesModel) {
        
        DispatchQueue.main.async {
            self.screen?.setupView(data: data)
            self.screen?.hideLoading()
            self.screen?.collectionView.reloadData()
        }
    }
}

//MARK: - DetailsViewProtocol

extension DetailsViewController: DetailsViewProtocol{
    func actionBack() {
        interactor?.navigateBack()
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension DetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        personListImageShuffle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonListCollectionViewCell.identifier, for: indexPath) as? PersonListCollectionViewCell
        let hero = personListImageShuffle[indexPath.row]
        cell?.SetupCell(data: hero)
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
        let idPerson = personListImageShuffle[indexPath.row]
        interactor?.updateDetails(id: idPerson, data: self.personListImageShuffle)
    }
}
