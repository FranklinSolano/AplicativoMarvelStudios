//
//  DetailsViewController.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

import UIKit

// MARK: - Protocol
protocol DetailsViewControllerDisplay: AnyObject {
    
}

// MARK: - DetailsViewController

final class DetailsViewController: UIViewController {
    
    // MARK: - Properties
    
    private var screen: DetailsView?
    var interactor: DetailsInteracting?
    var personListImage: [HeroesModel] = []
    private var personListImageShuffle: [HeroesModel] = []
    
    // MARK: - Lifecycle
    
    override func loadView() {
        screen = DetailsView()
        screen?.delegate = self
        screen?.configCollectoinView(delegate: self, dataSource: self)
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shuffleImage()
    }
    
    func shuffleImage(){
        personListImageShuffle = personListImage
        personListImageShuffle.shuffle()
    }
}


// MARK: - DisplayDetailsViewController

extension DetailsViewController: DetailsViewControllerDisplay {
    
}

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
}
