//
//  LoginFactory.swift
//  EstudosVIP
//
//  Created by Franklin  Stilhano Solano on 01/05/25.
//

import UIKit
@MainActor
protocol LoginFactoryProtocol {
    func make(navigationController: UINavigationController) -> (viewController: LoginViewController, coordinator: LoginCoordinator)
}

final class LoginFactory: LoginFactoryProtocol {

    func make(navigationController: UINavigationController) -> (viewController: LoginViewController, coordinator: LoginCoordinator) {

        let coordinator = LoginCoordinator()
        coordinator.navigationController = navigationController

        let service = LoginService()
        let presenter = LoginPresenter(view: nil, coordinator: coordinator) // view será ligada depois
        coordinator.presenter = presenter

        let interactor = LoginInteractor(presenter: presenter, service: service)

        let loginVC = LoginViewController(interactor: interactor)
        presenter.view = loginVC             // a vire é ligada aquii
        
        return (loginVC, coordinator)
    }
}

