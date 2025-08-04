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
    
    typealias Dependencies = HasDesignSystemComponentsInterface
    private let dependencies: Dependencies
    private let screen: LoginScreen
    private let interactor: LoginInteracting
    
    
    //MARK: - Init
    
    init(interactor: LoginInteracting, dependencies: Dependencies = DependencyContainer()) {
        self.interactor = interactor
        self.dependencies = dependencies
        self.screen = LoginScreen(dependencies: dependencies)
        super.init(nibName: nil, bundle: nil)
        self.screen.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = screen
        
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
        guard let email = screen.emailText,
              let passwpord = screen.passwordText else { return }
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


