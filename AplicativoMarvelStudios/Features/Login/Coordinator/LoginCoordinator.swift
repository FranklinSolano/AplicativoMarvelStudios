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
}

final class LoginCoordinator: LoginCoordinating {
    
    weak var navigationController: UINavigationController?
    var presenter: LoginPresenting?
    let homeFactory = HomeFactory()
    
    func navigateToHome() {
        guard let navigationController else { return }
        let tabBarController = TabbarViewController(homeFactory: homeFactory)
        navigationController.setViewControllers([tabBarController], animated: true)
    }
}
