//
//  ProfileFactory.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 23/06/25.
//

import UIKit

// MARK: - ProfileFactory

final class ProfileFactory: UIViewController  {
    
    // MARK: - Public Methods
    
    func make(navigationController: UINavigationController?) -> ProfileViewController {
        
        let coordinator = ProfileCoordinator()
        coordinator.navigationController = navigationController
        
        let presenter = ProfilePresenter(coordinator: coordinator)
        
        let dependencies = DependencyContainer()
        
        let interactor = ProfileInteractor(presenter: presenter, dependenciesService: dependencies)
        
        let profileVC = ProfileViewController(interactor: interactor,dependencies: dependencies)
        
        presenter.view = profileVC
        coordinator.presenter = presenter
        
        return profileVC
    }}
