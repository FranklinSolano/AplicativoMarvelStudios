//
//  FavoritesInteractor.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 09/06/25.
//

import UIKit

//MARK: - Protocol

protocol FavoritesInteracting: AnyObject {
    
}

//MARK: - FavoritesInteractor

final class FavoritesInteractor {
    
    var presenter: FavoritesPresenting? //weak
    private var service: FavoritesServicing?
    
    init(presenter: FavoritesPresenting?, service: FavoritesServicing?) {
        self.presenter = presenter
        self.service = service
    }
}

//MARK: - FavoritesInteracting

extension FavoritesInteractor: FavoritesInteracting {}
