//
//  LoginCoordinator.swift
//  EstudosVIP
//
//  Created by Franklin  Stilhano Solano on 01/05/25.
//

import UIKit

// MARK: - Protocol
@MainActor
protocol LoginCoordinating: AnyObject {
    func navigateToHome()
    func navigateToForgotPassword()
    func navigateToRegister()
}
@MainActor
final class LoginCoordinator {
    
    var navigationController: UINavigationController?
    var presenter: LoginPresenting?
    
    private let homeFactory = HomeFactory()
    private let favoritesFactory = FavoritesFactory()
    private let profileFactory = ProfileFactory()
    
}

// MARK: - LoginCoordinating

extension LoginCoordinator: LoginCoordinating {
    func navigateToHome() {
        guard let navigationController else { return }
        let tabBarController = TabbarViewController(homeFactory: homeFactory, favoritesFactory: favoritesFactory,
                                                    profileFactory: profileFactory)
        navigationController.setViewControllers([tabBarController], animated: true)
    }
    
    func navigateToForgotPassword() {
        //        guard let navigationController else { return }
        //        let forgotPassword = TabbarViewController(homeFactory: homeFactory)
        //        navigationController.setViewControllers([tabBarController], animated: true)
    }
    
    func navigateToRegister() {
        guard let navigationController else { return }
        let registerFactory = RegisterFactory()
        let registerVC = registerFactory.make(navigationController: navigationController)
        navigationController.pushViewController(registerVC, animated: true)
    }
}
