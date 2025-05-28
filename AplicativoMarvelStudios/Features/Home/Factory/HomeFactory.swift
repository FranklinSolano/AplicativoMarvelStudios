//
//  HomeFactory.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

class HomeFactory {
    
    func make(navigationController: UINavigationController) -> (viewController: HomeViewController, coordinator: HomeCoordinator) {
        
        let HomeVC = HomeViewController()
        let coordinator = HomeCoordinator()
        coordinator.navigationController = navigationController
        let presenter = HomePresenter(view: HomeVC, coordinator: coordinator)
        coordinator.presenter = presenter
        let service = HomeService()
        let interactor = HomeInteractor(presenter: presenter, service: service)
        HomeVC.interactor = interactor
        return (HomeVC, coordinator)
    }
    
}
