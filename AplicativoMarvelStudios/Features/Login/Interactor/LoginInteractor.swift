//
//  LoginInteractor.swift
//  EstudosVIP
//
//  Created by Franklin  Stilhano Solano on 01/05/25.
//

import Foundation

// MARK: - Protocol

protocol LoginInteracting: AnyObject{
    func navigateToHome()
}

// MARK: - Interactor

class LoginInteractor: LoginInteracting {
    
    // MARK: - Properties
    
    weak var presenter: LoginPresenting?
    private var service: LoginServicing?
    
    // MARK: - Init
    
    init(presenter: LoginPresenting, service: LoginServicing) {
        self.presenter = presenter
        self.service = service
    }
    
    //MARK: - Outher Methods
    
    func navigateToHome() {
        presenter?.presentNavigationToHome()
    }
}
