//
//  RegisterViewController.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 02/09/25.
//

import UIKit

protocol RegisterViewControllerDisplay: AnyObject{
    func showAlertLogin(title: String, message: String, success: Bool)
}

final class RegisterViewController: UIViewController {

    typealias Dependencies = HasDesignSystemComponentsInterface
    private let dependencies: Dependencies
    private let screen: RegisterScreen
    private let interactor: RegisterInteracting
    
    init(interactor: RegisterInteracting, dependencies: Dependencies = DependencyContainer()) {
        self.interactor = interactor
        self.dependencies = dependencies
        self.screen = RegisterScreen(dependencies: dependencies)
        super.init(nibName: nil , bundle: nil)
        self.screen.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
extension RegisterViewController: RegisterScreenProtocol {
    func actionBackButton() {
        interactor.navigationBackButtonInteractor()
    }
    
    func actionRegisterButton() {
        interactor.registerUser(
                  name: screen.nameTextField.text,
                  email: screen.emailTextField.text,
                  password: screen.passwordTextField.text,
                  confirmPassword: screen.confirmedPasswordTextField.text)
    }

}

//MARK: - RegisterViewControllerDisplay
extension RegisterViewController: RegisterViewControllerDisplay {
    func showAlertLogin(title: String, message: String, success: Bool) {
        self.getAlertController(title: title, message: message) { [weak self] in //weak
            if success {
                self?.interactor.navigationHomeButtonInteractor()
            }
            // Se não for sucesso, não faz nada após o alerta
        }
    }
    
    
    
    
}
