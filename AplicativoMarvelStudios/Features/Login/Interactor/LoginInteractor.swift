//
//  LoginInteractor.swift
//  EstudosVIP
//
//  Created by Franklin  Stilhano Solano on 01/05/25.
//

import Foundation

// MARK: - Protocol
@MainActor
protocol LoginInteracting {
    func navigateToHome()
    func navigateToForgotPassword()
    func navigateToRegister()
    func callServiceLogin(email: String, password: String)
}

// MARK: - Interactor

final class LoginInteractor {
    
    // MARK: - Properties
    
    let presenter: LoginPresenting
    private let dependencies: HasHttpServicesInterface & HasAuthenticationValidator
    
    // MARK: - Init
    
    init(presenter: LoginPresenting, dependencies: HasHttpServicesInterface & HasAuthenticationValidator) {
        self.presenter = presenter
        self.dependencies = dependencies
    }
    
    // MARK: - Outher Methods
}

// MARK: - LoginInteracting

extension LoginInteractor: LoginInteracting {
    
    func callServiceLogin(email: String, password: String) {
        
        do {
            let validEmail = try dependencies.authenticationValidator.validateEmail(email)
            let validPassword = try dependencies.authenticationValidator.validatePassword(password)
            
            let loginService = dependencies.httpServices.makeLoginService()
            
            loginService.callServiceLogin(
                email: validEmail,
                password: validPassword
            ) { [weak self] success, errorMessage in
                
                    self?.presenter.presentShowAlertLogin(
                        success: success,
                        errorMessage: errorMessage
                    )
            }
            
        } catch {
            presenter.presentShowAlertLogin(
                success: false,
                errorMessage: error.localizedDescription
            )
        }
    }
    
    func navigateToHome() {
        presenter.presentNavigateToHome()
    }
    
    func navigateToForgotPassword() {
        presenter.presentNavigateToForgotPassword()
    }
    
    func navigateToRegister() {
        presenter.presentNavigateToRegister()
    }
}
