//
//  ProfileFactory.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 23/06/25.
//

import UIKit


final class ProfileFactory {
    
    func make(navigationController: UINavigationController?) -> ProfileViewController {
        
        let profileVC = ProfileViewController()
        let coordinator = ProfileCoordinator()
        coordinator.navigationController = navigationController
        let presenter = ProfilePresenter(view: profileVC, coordinator: coordinator)
        coordinator.presenter = presenter
        let service = ProfileService()
        let interactor = ProfileInteractor(presenter: presenter, service: service)
        profileVC.interactor = interactor
        return profileVC
    }
}
