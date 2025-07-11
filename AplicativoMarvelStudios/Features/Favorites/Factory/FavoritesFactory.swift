//
//  FavoritesFactory.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 22/06/25.
//

import UIKit

@MainActor
protocol FavoritesFactoryProtocol {
    func make(navigationController: UINavigationController?) -> FavoritesViewController
}

final class FavoritesFactory: FavoritesFactoryProtocol {
    func make(navigationController: UINavigationController?) -> FavoritesViewController {
        
        let coordinator = FavoritesCoordinator()
        coordinator.navigationController = navigationController
        
        let presenter = FavoritesPresenter(coordinator: coordinator)
        
        let service = FavoritesService()
        
        let interactor = FavoritesInteractor(presenter: presenter, service: service)
        
        let favoritesVC = FavoritesViewController(interactor: interactor)
        
        presenter.view = favoritesVC
        coordinator.presenter = presenter
        
        return favoritesVC
    }
}
