//
//  ViewController.swift
//  EstudosVIP
//
//  Created by Franklin  Stilhano Solano on 01/05/25.
//

import UIKit

// MARK: - Protocols

protocol LoginViewControllerDisplay: AnyObject {
    func showAlertLogin(title: String, message: String)
}

// MARK: - LoginViewController

final class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    private var screen: LoginScreen?
    var interactor: LoginInteracting?
    
    // MARK: - Lifecycle
    
    override func loadView() {
        screen = LoginScreen()
        screen?.delegate = self
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
}

// MARK: - LoginScreenProtocol

extension LoginViewController: LoginScreenProtocol {
    
    func ActionRegisterButton() {
        interactor?.navigateToRegister()
    }
    
    func ActionForgotPasswordButton() {
        interactor?.navigateToForgotPassword()
    }
    
    func ActionLoginButton() {
        guard let email = screen?.emailTextField.text,
              let passwpord = screen?.passwordTextField.text else { return }
        interactor?.callServiceLogin(email: email, password: passwpord)
    }
}

// MARK: - LoginViewControllerDisplay

extension LoginViewController: LoginViewControllerDisplay {
    func showAlertLogin(title: String, message: String) {
        self.getAlertController(title: title, message: message) {
            if title != "Deu Ruim" {
                self.interactor?.navigateToHome()
            } else {
                
            }
        }
    }
    
    
}

