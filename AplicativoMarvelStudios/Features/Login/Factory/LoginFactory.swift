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
        let service = dependencies.httpServices.makeLoginSErvice()
        
        let presenter = LoginPresenter(view: nil, coordinator: coordinator)
        coordinator.presenter = presenter
        
        let interactor = LoginInteractor(presenter: presenter, service: service)
        
        let loginVC = LoginViewController(interactor: interactor)
        presenter.view = loginVC
        
        return (loginVC, coordinator)
    }

}
