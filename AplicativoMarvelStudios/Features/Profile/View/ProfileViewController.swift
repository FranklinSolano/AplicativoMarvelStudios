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
    
    var screen: ProfileScreen?
    var interactor: ProfileInteracting?
    
    // MARK: - Lifecycle
    
    override func loadView() {
        screen = ProfileScreen()
        screen?.delegate = self
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - ProfileScreenProtocol

extension ProfileViewController: ProfileScreenProtocol {
    func actionExitApp() {
        interactor?.logoutUser()
    }
}

// MARK: - ProfileViewDisplay

extension ProfileViewController: ProfileViewDisplay {
    func logoutError(message: String) {
        print(message)
    }
}
