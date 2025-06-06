//
//  DetailsCoordinator.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//


import UIKit

protocol DetailsCoordinating {
    func navigateBack()
}

final class DetailsCoordinator: DetailsCoordinating {
    func navigateBack() {
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Properties
    
    weak var navigationController: UINavigationController?
    var presenter: DetailsPresenting?
    
    // MARK: - Navigation Methods
}
