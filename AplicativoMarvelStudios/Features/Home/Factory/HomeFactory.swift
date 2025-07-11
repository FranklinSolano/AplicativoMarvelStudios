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

        // 1. Coordinator
        let coordinator = HomeCoordinator()
        coordinator.navigationController = navigationController

        // 2. Presenter (sem view por enquanto)
        let presenter = HomePresenter(coordinator: coordinator)

        // 3. Service
        let service = HomeService()

        // 4. Interactor recebe o presenter
        let interactor = HomeInteractor(presenter: presenter, service: service)

        // 5. ViewController recebe o interactor no init
        let homeVC = HomeViewController(interactor: interactor)

        // 6. Agora ligamos a view ao presenter e o presenter ao coordinator
        presenter.view = homeVC
        coordinator.presenter = presenter

        return homeVC
    }
}
