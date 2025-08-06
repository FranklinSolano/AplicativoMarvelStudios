//
//  FavoritesFactory.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 22/06/25.
//

import UIKit

final class FavoritesFactory: UIViewController {
    
    func make(navigationController: UINavigationController?) -> FavoritesViewController {
        
        let coordinator = FavoritesCoordinator()
        coordinator.navigationController = navigationController
        
        let presenter = FavoritesPresenter(coordinator: coordinator)
        
        let dependencies = DependencyContainer()
        
        let interactor = FavoritesInteractor(presenter: presenter, dependencies: dependencies)
        
        let favoritesVC = FavoritesViewController(interactor: interactor)
        
        presenter.view = favoritesVC
        coordinator.presenter = presenter
        
        return favoritesVC
    }
}
