//
//  RegisterCoordinator.swift
//  AplicativoRickAndMorty
//
//  Created by Franklin  Stilhano Solano on 28/10/25.
//

import UIKit
// MARK: - Protocol
protocol RegisterCoordinating {
    func navigationBackButtonCoordinator()
    func navigationhomeButtonCoordinator()
}

// MARK: - RegisterCoordinator
final class RegisterCoordinator {
    var navigation: UINavigationController?
    private let homeFactory = HomeFactory()
    private let favoritesFactory = FavoritesFactory()
    private let profileFactory = ProfileFactory()
}
// MARK: - RegisterCoordinating
extension RegisterCoordinator: RegisterCoordinating {
    func navigationhomeButtonCoordinator() {
        guard let navigation else { return }
        let tabBarController = TabbarViewController(homeFactory: homeFactory, favoritesFactory: favoritesFactory,
                                                    profileFactory: profileFactory)
        navigation.setViewControllers([tabBarController], animated: true)
    }
    
    func navigationBackButtonCoordinator() {
        guard let navigation else { return}
        navigation.popViewController(animated: true)
    }
}
