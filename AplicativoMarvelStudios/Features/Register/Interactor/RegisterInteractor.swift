//
//  RegisterInteractor.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 02/09/25.
//

import Foundation

protocol RegisterInteracting {
    func navigationBackButtonInteractor()
    func navigationHomeButtonInteractor()
    func registerUser(name: String?, email: String?, password: String?, confirmPassword: String?)
}

final class RegisterInteractor {
    var presenter: RegisterPresenting
    private var dependencies: HasHttpServicesInterface & HasAuthenticationValidator
    
    init(presenter: RegisterPresenting, dependencies: HasHttpServicesInterface & HasAuthenticationValidator) {
        self.presenter = presenter
        self.dependencies = dependencies
    }
}

// MARK: - RegisterInteracting
extension RegisterInteractor: RegisterInteracting {
    func navigationHomeButtonInteractor() {
        self.presenter.navigationHomeButtonPresenter()
    }
    
    func registerUser(name: String?, email: String?, password: String?, confirmPassword: String?) {
        do {
            let validName = try dependencies.authenticationValidator.validateName(name ?? "")
            let validEmail = try dependencies.authenticationValidator.validateEmail(email ?? "")
            let validPassword = try dependencies.authenticationValidator.validatePassword(password ?? "")
            _ = try dependencies.authenticationValidator.validateConfirmPassword(validPassword, confirmPassword ?? "")
            
            let user = UserModel(
                name: validName,
                email: validEmail,
                password: validPassword
            )
            self.dependencies.httpServices.makeRegisterService().createUser(user) { result in
                
                switch result {
                    
                case .success:
                    self.presenter.showAlertSuccessPresenter()
                case .failure(let error):
                    let registerError = AuthenticationError.firebaseError(error.localizedDescription)
                    self.presenter.showAlertFailPresenter(registerError)
                }
            }
        } catch {
            
            if let registerError = error as? AuthenticationError {
                self.presenter.showAlertFailPresenter(registerError)
            } else {
                self.presenter.showAlertFailPresenter(.firebaseError(error.localizedDescription))
            }
        }
    }
    
    func navigationBackButtonInteractor() {
        presenter.navigationBackButtonPresenter()
    }
}
