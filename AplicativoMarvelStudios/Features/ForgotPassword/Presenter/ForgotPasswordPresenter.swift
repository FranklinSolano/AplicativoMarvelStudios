import Foundation

protocol ForgotPasswordPresenting {
    func navigationBackButtonPresenter()
    func presentSuccess()
    func presentError(error: AuthenticationError)
    func presentValidationError(error: AuthenticationError)
    func presentUnknownError()
}

final class ForgotPasswordPresenter {
    
    weak var view: ForgotPasswordViewControllerDisplay?
    let coordinator: ForgotPasswordCoordinating
    
    init(view: ForgotPasswordViewControllerDisplay? = nil, coordinator: ForgotPasswordCoordinating) {
        self.view = view
        self.coordinator = coordinator
    }
}

extension ForgotPasswordPresenter: ForgotPasswordPresenting {
    func navigationBackButtonPresenter() {
        coordinator.navigationBackButtonCoordinator()
    }
    
    func presentSuccess() {
        view?.showAlertSuccess(
            title: "Sucesso",
            message: "E-mail de redefinição enviado com sucesso! Verifique sua caixa de entrada."
        )
    }
    
    func presentError(error: AuthenticationError) {
        view?.showAlertError(
            title: "Erro",
            message: error.localizedDescription
        )
    }
    
    func presentValidationError(error: AuthenticationError) {
        view?.showAlertError(
            title: "Atenção",
            message: error.localizedDescription
        )
    }
    
    func presentUnknownError() {
        view?.showAlertError(
            title: "Erro",
            message: "Ocorreu um erro inesperado. Tente novamente."
        )
    }
}
