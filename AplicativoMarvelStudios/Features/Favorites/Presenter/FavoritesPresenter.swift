//
//  FavoritesPresenter.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 09/06/25.
//

import UIKit

// MARK: - FavoritesPresenting

protocol FavoritesPresenting {
    
}

// MARK: - FavoritesPresenter

final class FavoritesPresenter {
    
    weak var view: FavoritesViewControllerDisplay?
    private var coordinator: FavoritesCoordinating
    
    init(view: FavoritesViewControllerDisplay? = nil, coordinator: FavoritesCoordinating) {
        self.view = view
        self.coordinator = coordinator
    }
}

// MARK: - FavoritesPresenting

extension FavoritesPresenter: FavoritesPresenting {}
