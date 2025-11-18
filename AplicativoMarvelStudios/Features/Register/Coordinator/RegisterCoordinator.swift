//
//  RegisterCoordinator.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 02/09/25.
//

import UIKit

protocol RegisterCoordinating {
    func navigationBackButtonCoordinator()
}

final class RegisterCoordinator {
    var navigationController: UINavigationController?
    var presenter: RegisterPresenting?
    
}

extension RegisterCoordinator: RegisterCoordinating {
    func navigationBackButtonCoordinator() {
        guard let navigationController else {return}
        navigationController.popViewController(animated: true)
    }
    
    
    
}
