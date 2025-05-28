//
//  ViewController.swift
//  EstudosVIP
//
//  Created by Franklin  Stilhano Solano on 01/05/25.
//

import UIKit

// MARK: - Protocols

protocol LoginViewControllerDisplay: AnyObject {
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

// MARK: - LoginScreenProtocol

extension LoginViewController: LoginScreenProtocol {
    func ActionLoginButton() {
        interactor?.navigateToHome()
    }
}

// MARK: - LoginViewControllerDisplay

extension LoginViewController: LoginViewControllerDisplay {
    
}

