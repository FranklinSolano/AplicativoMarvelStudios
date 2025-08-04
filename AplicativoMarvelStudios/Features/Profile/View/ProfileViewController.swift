//
//  SettingsViewController.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//


import UIKit
import FirebaseAuth

// MARK: - Protocol

protocol ProfileViewDisplay: AnyObject {
    func logoutError(message: String)
}

// MARK: - ProfileViewController

final class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    
    typealias Dependencies = HasDesignSystemComponentsInterface
    private let dependencies: Dependencies
    private let screen: ProfileScreen
    private let interactor: ProfileInteracting
    
    
    //MARK: - init
    
    init(interactor: ProfileInteracting, dependencies: Dependencies = DependencyContainer()) {
        self.interactor = interactor
        self.dependencies = dependencies
        let screenDependency = ProfileDependency(components: dependencies.designSystemComponents)
        self.screen = ProfileScreen(dependency: screenDependency)
        super.init(nibName: nil, bundle: nil)
        self.screen.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - ProfileScreenProtocol

extension ProfileViewController: ProfileScreenProtocol {
    func actionExitApp() {
        interactor.logoutUser()
    }
}

// MARK: - ProfileViewDisplay

extension ProfileViewController: ProfileViewDisplay {
    func logoutError(message: String) {
        print(message)
    }
}
