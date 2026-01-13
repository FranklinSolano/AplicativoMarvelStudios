//
//  RegisterFactory.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 02/09/25.
//

import UIKit

// MARK: - RegisterFactory

final class RegisterFactory {
    
    // MARK: - Public Methods
    
    func make(navigationController: UINavigationController?) -> RegisterViewController {
        
        let coordinator = RegisterCoordinator()
        coordinator.navigation = navigationController
        
        let presenter = RegisterPresenter(coordinator: coordinator)
        
        let dependencies = DependencyContainer()
        
        let interactor = RegisterInteractor(presenter: presenter, dependencies: dependencies)
        
        let registerVC = RegisterViewController(interactor: interactor, dependencies: dependencies)
        
        presenter.view = registerVC
        
        return registerVC
    }}
