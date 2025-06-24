//
//  SettingsViewController.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit
import FirebaseAuth


protocol ProfileViewDisplay: AnyObject {
    func logoutError(message: String)
}

class ProfileViewController: UIViewController {
    
    var screen: ProfileScreen?
    var interactor: ProfileInteracting?
    
    override func loadView() {
        screen = ProfileScreen()
        screen?.delegate = self
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ProfileViewController: ProfileScreenProtocol {
    func actionExitApp() {
        interactor?.logoutUser()
    }
    
    
}

extension ProfileViewController: ProfileViewDisplay {
    func logoutError(message: String) {
        print(message)
    }
}
        
