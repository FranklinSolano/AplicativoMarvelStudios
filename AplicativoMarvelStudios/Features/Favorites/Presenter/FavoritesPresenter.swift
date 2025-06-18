//
//  FavoritesPresenter.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 09/06/25.
//

import UIKit

//MARK: - Protocol

protocol FavoritesPresenting: AnyObject{
    
}

//MARK: - FavoritesPresenter

final class FavoritesPresenter {
    
    weak var view: FavoritesViewControllerDisplay?
    private var coordinator: FavoritesCoordinating?
    
    init(view: FavoritesViewControllerDisplay, coordinator: FavoritesCoordinating) {
        self.view = view
        self.coordinator = coordinator
    }
}

//MARK: - FavoritesPresenting

extension FavoritesPresenter: FavoritesPresenting {
    
}
