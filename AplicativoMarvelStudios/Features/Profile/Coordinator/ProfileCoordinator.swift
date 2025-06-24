//
//  ProfileCoordinator.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 23/06/25.
//

import UIKit

protocol ProfileCoordinating: AnyObject {
    func navigateToLogin()
}

final class ProfileCoordinator: ProfileCoordinating {
    weak var navigationController: UINavigationController?
    var presenter: ProfilePresenting?
    
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
    
    

