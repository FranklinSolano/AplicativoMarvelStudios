//
//  FavoritosViewController.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

// MARK: - Protocol

protocol FavoritesViewControllerDisplay: AnyObject {
    
}

// MARK: - FavoritesViewController

final class FavoritesViewController: UIViewController {
    
    // MARK: - Properties
    
    var screen: FavoritesScreen?
    var interactor: FavoritesInteracting?
    private var favorites: [HeroesModel] = []
    
    // MARK: - Lifecycle
    
    override func loadView() {
        screen = FavoritesScreen()
        screen?.configCollectoinView(delegate: self, dataSource: self)
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - FavoritesViewControllerDisplay

extension FavoritesViewController: FavoritesViewControllerDisplay {}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension FavoritesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if favorites.isEmpty {
            return 1
        } else {
            return favorites.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if favorites.isEmpty {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoritesEmptyCell.identifier, for: indexPath) as? FavoritesEmptyCell
            return cell ?? UICollectionViewCell()
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCharactersCollectionViewCell.identifier, for: indexPath) as? ListCharactersCollectionViewCell
            return cell ?? UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if favorites.isEmpty {
            return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
        } else {
            let spacing: CGFloat = 10
            let horizontalInset: CGFloat = 16
            let totalSpacing = (2 * horizontalInset) + spacing
            let width = (collectionView.bounds.width - totalSpacing) / 2
            return CGSize(width: width, height: width * 1.3)
        }
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if favorites.isEmpty {
            return 1
        } else {
            return 15
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if favorites.isEmpty {
            return UIEdgeInsets()
        } else {
            return UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12)
        }
    }
}
