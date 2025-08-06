//
//  LoginFactory.swift
//  EstudosVIP
//
//  Created by Franklin  Stilhano Solano on 01/05/25.
//

import UIKit

final class LoginFactory: UIViewController {

    func make(navigationController: UINavigationController) -> (viewController: LoginViewController, coordinator: LoginCoordinator) {
        let coordinator = LoginCoordinator()
        coordinator.navigationController = navigationController
        let dependencies = DependencyContainer()
        
        let presenter = LoginPresenter(view: nil, coordinator: coordinator)
        coordinator.presenter = presenter
        
        let interactor = LoginInteractor(presenter: presenter, dependenciesService: dependencies)
        
        let loginVC = LoginViewController(interactor: interactor, dependencies: dependencies)
        presenter.view = loginVC
        
        return (loginVC, coordinator)
    }

}
