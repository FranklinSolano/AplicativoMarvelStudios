//
//  RegisterViewController.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 02/09/25.
//

import UIKit

protocol RegisterViewControllerDisplay: AnyObject {
    
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
    
}
