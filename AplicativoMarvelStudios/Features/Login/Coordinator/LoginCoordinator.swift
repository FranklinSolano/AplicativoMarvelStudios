//
//  LoginCoordinator.swift
//  EstudosVIP
//
//  Created by Franklin  Stilhano Solano on 01/05/25.
//

import UIKit

// MARK: - Protocol

protocol LoginCoordinating {
    func navigateToHome()
    func navigateToForgotPassword()
    func navigateToRegister()
}

final class LoginCoordinator {
    
    weak var navigationController: UINavigationController?
    var presenter: LoginPresenting?
    let homeFactory = HomeFactory()
}

// MARK: - LoginCoordinating

extension LoginCoordinator: LoginCoordinating {
    func navigateToHome() {
        guard let navigationController else { return }
        let tabBarController = TabbarViewController(homeFactory: homeFactory)
        navigationController.setViewControllers([tabBarController], animated: true)
    }
    
    func navigateToForgotPassword() {
//        guard let navigationController else { return }
//        let forgotPassword = TabbarViewController(homeFactory: homeFactory)
//        navigationController.setViewControllers([tabBarController], animated: true)
    }
    
    func navigateToRegister() {
//        guard let navigationController else { return }
//        let register = TabbarViewController(homeFactory: homeFactory)
//        navigationController.setViewControllers([tabBarController], animated: true)
    }
    
    
}
