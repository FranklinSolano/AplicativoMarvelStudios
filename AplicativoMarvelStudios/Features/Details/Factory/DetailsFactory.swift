//
//  DetailsFactory.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

import UIKit

final class DetailsFactory {
    
    func make(navigationController: UINavigationController?) -> DetailsViewController {
        
        let detailsVC = DetailsViewController()
        let coordinator = DetailsCoordinator()
        coordinator.navigationController = navigationController
        let presenter = DetailsPresenter(view: detailsVC, coordinator: coordinator)
        coordinator.presenter = presenter
        let service = DetailsService()
        let interactor = DetailsInteractor(presenter: presenter, service: service)
        detailsVC.interactor = interactor
        return detailsVC
    }
}
