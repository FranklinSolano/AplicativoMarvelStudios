//
//  FavoritosViewController.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

//MARK: Protocol

protocol FavoritesViewControllerDisplay: AnyObject {
    
}

final class FavoritesViewController: UIViewController {
    
    var screen: FavoritesScreen?
    var interactor: FavoritesInteracting?
    
    override func loadView() {
        screen = FavoritesScreen()
        screen?.configCollectoinView(delegate: self, dataSource: self)
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - FavoritesViewControllerDisplay

extension FavoritesViewController: FavoritesViewControllerDisplay {
    
}

extension FavoritesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoritesEmptyCell.identifier, for: indexPath) as? FavoritesEmptyCell
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}
