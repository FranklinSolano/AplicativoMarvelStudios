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
        
        let favoritesVC = FavoritesViewController()
        let coordinator = FavoritesCoordinator()
        coordinator.navigationController = navigationController
        let presenter = FavoritesPresenter(view: favoritesVC, coordinator: coordinator)
        coordinator.presenter = presenter
        let service = FavoritesService()
        let interactor = FavoritesInteractor(presenter: presenter, service: service)
        favoritesVC.interactor = interactor
        return favoritesVC
    }
}
