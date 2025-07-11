//
//  ProfileFactory.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 23/06/25.
//

import UIKit

protocol ProfileFactoryProtocol {
    func make(navigationController: UINavigationController?) -> ProfileViewController
}

// MARK: - ProfileFactory

final class ProfileFactory: ProfileFactoryProtocol  {
    
    // MARK: - Public Methods
    
    func make(navigationController: UINavigationController?) -> ProfileViewController {
        
        let coordinator = ProfileCoordinator()
        coordinator.navigationController = navigationController
        
        let presenter = ProfilePresenter(coordinator: coordinator)
        
        let service = ProfileService()
        
        let interactor = ProfileInteractor(presenter: presenter, service: service)
        
        let profileVC = ProfileViewController(interactor: interactor)
        
        presenter.view = profileVC
        coordinator.presenter = presenter
        
        return profileVC
    }}
