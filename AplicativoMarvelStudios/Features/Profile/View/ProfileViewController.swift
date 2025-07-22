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
    var interactor: ProfileInteracting
    
    //MARK: - init
    
    init(interactor: ProfileInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        interactor.logoutUser()
    }
}

// MARK: - ProfileViewDisplay

extension ProfileViewController: ProfileViewDisplay {
    func logoutError(message: String) {
        print(message)
    }
}
