//
//  RegisterFactory.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 02/09/25.
//

import UIKit

// MARK: - RegisterFactory

final class RegisterFactory: UIViewController {
    
    // MARK: - Public Methods
    
    func make(navigationController: UINavigationController?) -> RegisterViewController {
        
        let coordinator = RegisterCoordinator()
        coordinator.navigation = navigationController
        
        let presenter = RegisterPresenter(coordinator: coordinator)
        
        let dependencies = DependencyContainer()
        
        let interactor = RegisterInteractor(presenter: presenter, dependneciesService: dependencies)
        
        let registerVC = RegisterViewController(interactor: interactor, dependencies: dependencies)
        
        presenter.view = registerVC
//        coordinator.presenter = presenter
        
        return registerVC
    }}
