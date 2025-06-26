//
//  FavoritesPresenter.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 09/06/25.
//

import UIKit

//MARK: - FavoritesPresenting

protocol FavoritesPresenting: AnyObject{
    
}

//MARK: - FavoritesPresenter

final class FavoritesPresenter {
    
    var view: FavoritesViewControllerDisplay? //weak
    private var coordinator: FavoritesCoordinating?
    
    init(view: FavoritesViewControllerDisplay, coordinator: FavoritesCoordinating) {
        self.view = view
        self.coordinator = coordinator
    }
}

//MARK: - FavoritesPresenting

extension FavoritesPresenter: FavoritesPresenting {}
