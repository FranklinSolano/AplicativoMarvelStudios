//
//  ViewController.swift
//  EstudosVIP
//
//  Created by Franklin  Stilhano Solano on 01/05/25.
//

import UIKit

// MARK: - Protocols

protocol LoginViewControllerDisplay: AnyObject {
    func showAlertLogin(title: String, message: String, success: Bool)
}

// MARK: - LoginViewController

final class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    private var screen: LoginScreen?
    let interactor: LoginInteracting
    
    //MARK: - Init
    
    init(interactor: LoginInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        let dependency = LoginScreenDependency(emailLabel: DSLabelAdapter(), emailTextField: DSTextFieldAdapter(), passwordLabel: DSLabelAdapter(), passwordTextField: DSTextFieldAdapter(), forgotPasswordButton: DSButtonTitlesAdapter(), loginButton: DSButtonAdapter(), registerButton: DSButtonTitlesAdapter())
        let loginScreen = LoginScreen(dependency: dependency)
        loginScreen.delegate = self
        self.screen = loginScreen
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - LoginScreenProtocol

extension LoginViewController: LoginScreenProtocol {
    
    func ActionRegisterButton() {
        interactor.navigateToRegister()
    }
    
    func ActionForgotPasswordButton() {
        interactor.navigateToForgotPassword()
    }
    
    func ActionLoginButton() {
        guard let email = screen?.emailText,
              let passwpord = screen?.passwordText else { return }
        interactor.callServiceLogin(email: email, password: passwpord)
    }
}

// MARK: - LoginViewControllerDisplay

extension LoginViewController: LoginViewControllerDisplay {
    func showAlertLogin(title: String, message: String, success: Bool) {
        self.getAlertController(title: title, message: message) { [ self] in //weak
            if success {
                self.interactor.navigateToHome()
            }
            // Se não for sucesso, não faz nada após o alerta
        }
    }
}

