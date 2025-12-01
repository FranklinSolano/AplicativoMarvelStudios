//
//  DetailsFactory.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

import UIKit

// MARK: - DetailsFactory

final class DetailsFactory: UIViewController {
    func make(navigationController: UINavigationController?) -> DetailsViewController {
        let coordinator = DetailsCoordinator()
        coordinator.navigationController = navigationController
        
        let presenter = DetailsPresenter(coordinator: coordinator)
        
        let dependencies = DependencyContainer()
        
        let interactor = DetailsInteractor(presenter: presenter, dependenciesService: dependencies)
        
        let detailsVC = DetailsViewController(interactor: interactor, dependencies: dependencies)
        
        presenter.view = detailsVC
        coordinator.presenter = presenter
        
        return detailsVC
    }
}
