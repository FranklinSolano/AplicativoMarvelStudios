//
//  FavoritesInteractor.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 09/06/25.
//

import UIKit

//MARK: - Protocol

protocol FavoritesInteracting {
    
}

//MARK: - FavoritesInteractor

final class FavoritesInteractor {
    
    var presenter: FavoritesPresenting
    private var dependencies: HasHttpServicesInterface
    
    init(presenter: FavoritesPresenting, dependencies: HasHttpServicesInterface) {
        self.presenter = presenter
        self.dependencies = dependencies
    }
}

//MARK: - FavoritesInteracting

extension FavoritesInteractor: FavoritesInteracting {
    
//    let favoritesService = dependencies.httpServices.makeFavoritesService()
}
