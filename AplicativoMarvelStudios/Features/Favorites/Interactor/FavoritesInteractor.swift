//
//  FavoritesInteractor.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 09/06/25.
//

import UIKit

// MARK: - Protocol

protocol FavoritesInteracting {
    
}

// MARK: - FavoritesInteractor

final class FavoritesInteractor {
    
    var presenter: FavoritesPresenting
    private var dependenciesService: HasHttpServicesInterface
    
    init(presenter: FavoritesPresenting, dependenciesService: HasHttpServicesInterface) {
        self.presenter = presenter
        self.dependenciesService = dependenciesService
    }
}

// MARK: - FavoritesInteracting

extension FavoritesInteractor: FavoritesInteracting {
    
//    let favoritesService = dependencies.httpServices.makeFavoritesService()
}
