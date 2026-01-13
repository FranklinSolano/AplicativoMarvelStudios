import FirebaseAuth
import Foundation

protocol ForgotPasswordInteracting {
    func navigationBackButtonInteractor()
    func forgotPasswordToEnter(email: String?)
}

final class ForgotPasswordInteractor {
    
    let presenter: ForgotPasswordPresenting
    private let dependencies: HasHttpServicesInterface & HasAuthenticationValidator
    
    init(presenter: ForgotPasswordPresenting, dependencies: HasHttpServicesInterface & HasAuthenticationValidator) {
        self.presenter = presenter
        self.dependencies = dependencies
    }
}

extension ForgotPasswordInteractor: ForgotPasswordInteracting {
    func forgotPasswordToEnter(email: String?) {
        do {
            let validEmail = try dependencies.authenticationValidator.validateEmail(email ?? "")
            
            dependencies.httpServices.makeForgotPasswordService()
                .forgotPasswordToEnter(email: validEmail) { [weak self] result in
                    guard let self = self else { return }
                
                    switch result {
                    case .success:
                        // Passa apenas o resultado do sucesso
                        self.presenter.presentSuccess()
                        
                    case .failure(let error):
                        // Passa o erro, não a mensagem formatada
                        self.presenter.presentError(error: error)
                    }
                }
            
        } catch {
            // Passa o erro de validação
            if let authError = error as? AuthenticationError {
                presenter.presentValidationError(error: authError)
            } else {
                presenter.presentUnknownError()
            }
        }
    }
    
    func navigationBackButtonInteractor() {
        presenter.navigationBackButtonPresenter()
    }
}
