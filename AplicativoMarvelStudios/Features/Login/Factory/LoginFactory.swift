//
//  LoginFactory.swift
//  EstudosVIP
//
//  Created by Franklin  Stilhano Solano on 01/05/25.
//

import UIKit

//final class LoginFactory {
//    
//    func make(navigationController: UINavigationController) -> (viewController: LoginViewController, coordinator: LoginCoordinator) {
//        
//        let loginVC = LoginViewController()
//        let coordinator = LoginCoordinator()
//        coordinator.navigationController = navigationController
//        let presenter = LoginPresenter(view: loginVC, coordinator: coordinator)
//        coordinator.presenter = presenter
//        let service = LoginService()
//        let interactor = LoginInteractor(presenter: presenter, service: service)
//        loginVC.interactor = interactor
//        return (loginVC, coordinator)
//    }
//}
final class LoginFactory {

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

