//
//  RegisterViewController.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 02/09/25.
//

import UIKit

protocol RegisterViewControllerDisplay: AnyObject {
    func showAlertErrorPassword(title: String, message: String)
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

extension RegisterViewController: RegisterViewControllerDisplay {
    
    func showAlertErrorPassword(title: String, message: String) {
        self.getAlertController(title: title, message: message)
    }
    
    
}

extension RegisterViewController: RegisterScreenProtocol {
    func actionBackButton() {
        interactor.navigationBackButtonInteractor()
    }
    
    func actionRegisterButton() {
    }
    
    
}
