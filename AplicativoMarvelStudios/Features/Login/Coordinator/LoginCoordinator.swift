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

final class LoginCoordinator: LoginCoordinating{
    
    // MARK: - Properties
    
    weak var navigationController: UINavigationController?
    var presenter: LoginPresenting?
    
    // MARK: - Navigation Methods
    
    func navigateToHome() {
        guard let navigationController else { return }
        let homeVC = TabbarViewController()
        navigationController.pushViewController(homeVC, animated: true)

    }
}
