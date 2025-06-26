//
//  ProfileCoordinator.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 23/06/25.
//

import UIKit

// MARK: - ProfileCoordinating

protocol ProfileCoordinating: AnyObject {
    func navigateToLogin()
}

// MARK: - ProfileCoordinator

final class ProfileCoordinator: ProfileCoordinating {
    
    // MARK: - Properties
    
    var navigationController: UINavigationController? //weak
    var presenter: ProfilePresenting?
    
    // MARK: - Navigation Methods
    
    func navigateToLogin() {
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
              let window = sceneDelegate.window else { return }
        
        let loginNav = sceneDelegate.startLoginFlow()
        window.rootViewController = loginNav
        
        UIView.transition(with: window,
                          duration: 0.5,
                          options: [.transitionFlipFromLeft],
                          animations: nil,
                          completion: nil)
    }
}



