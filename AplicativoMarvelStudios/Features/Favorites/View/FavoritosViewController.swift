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

final class FavoritosViewController: UIViewController {
    
    var screen: FavoritesScreen?
//    var interactor: FavoritesInteracting?
    
    override func loadView() {
        screen = FavoritesScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - FavoritesViewControllerDisplay

extension FavoritosViewController: FavoritesViewControllerDisplay {
    
}
