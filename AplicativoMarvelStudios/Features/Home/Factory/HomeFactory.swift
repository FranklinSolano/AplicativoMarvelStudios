//
//  HomeFactory.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

@MainActor
protocol HomeFactoryProtocol {
    func make(navigationController: UINavigationController?) -> HomeViewController
}

final class HomeFactory: HomeFactoryProtocol {
   
    func make(navigationController: UINavigationController?) -> HomeViewController {
        let homeVC = HomeViewController()
        let coordinator = HomeCoordinator()
        coordinator.navigationController = navigationController
        let presenter = HomePresenter(view: homeVC, coordinator: coordinator)
        coordinator.presenter = presenter
        let service = HomeService()
        let interactor = HomeInteractor(presenter: presenter, service: service)
        homeVC.interactor = interactor
        return homeVC
    }
}
