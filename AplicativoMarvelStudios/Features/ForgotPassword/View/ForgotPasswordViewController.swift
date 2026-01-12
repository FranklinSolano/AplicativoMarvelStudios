import UIKit

protocol ForgotPasswordViewControllerDisplay: AnyObject {
    func showAlertSuccess(title: String, message: String)
    func showAlertError(title: String, message: String)
}

final class ForgotPasswordViewController: UIViewController {
    
    typealias Dependencies = HasDesignSystemComponentsInterface
    private let dependencies: Dependencies
    private let screen: ForgotPasswordScreen
    private let interactor: ForgotPasswordInteracting
    
    init(interactor: ForgotPasswordInteracting, dependencies: Dependencies = DependencyContainer()) {
        self.interactor = interactor
        self.dependencies = dependencies
        self.screen = ForgotPasswordScreen(dependencies: dependencies)
        super.init(nibName: nil, bundle: nil)
        screen.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = screen
    }
}

extension ForgotPasswordViewController: ForgotPasswordViewControllerDisplay {
    func showAlertSuccess(title: String, message: String) {
        self.getAlertController(title: title, message: message) { [weak self] in
            // Volta para tela anterior após sucesso
            self?.interactor.navigationBackButtonInteractor()
        }
    }
    
    func showAlertError(title: String, message: String) {
        self.getAlertController(title: title, message: message)
        // Não faz nada após o alerta de erro
    }
}

extension ForgotPasswordViewController: ForgotPasswordScreenProtocol {
    func actionBackButton() {
        interactor.navigationBackButtonInteractor()
    }
    
    func actionEnterButton() {
        let email = screen.emailTextField.text
        interactor.forgotPasswordToEnter(email: email)
    }
}
