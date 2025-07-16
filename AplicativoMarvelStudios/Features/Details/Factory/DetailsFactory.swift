//
//  DetailsFactory.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

import UIKit

//MARK: - DetailsFactory

final class DetailsFactory: UIViewController {
    func make(navigationController: UINavigationController?) -> DetailsViewController {
        let coordinator = DetailsCoordinator()
        coordinator.navigationController = navigationController
        
        let presenter = DetailsPresenter(coordinator: coordinator)
        
        let service = DetailsService()
        
        let interactor = DetailsInteractor(presenter: presenter, service: service)
        
        let detailsVC = DetailsViewController(interactor: interactor)
        
        presenter.view = detailsVC
        coordinator.presenter = presenter
        
        return detailsVC
    }
}
