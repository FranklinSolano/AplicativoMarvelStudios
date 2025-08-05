//
//  HomeFactory.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//
import UIKit

final class HomeFactory: UIViewController {
    
    func make(navigationController: UINavigationController?) -> HomeViewController {

        // 1. Coordinator
        let coordinator = HomeCoordinator()
        coordinator.navigationController = navigationController

        // 2. Presenter (sem view por enquanto)
        let presenter = HomePresenter(coordinator: coordinator)

        let dependencies = DependencyContainer()
        let service = dependencies.httpServices.makeHomeService()

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
