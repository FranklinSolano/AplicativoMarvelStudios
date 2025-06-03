//
//  HomeCoordinator.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

// MARK: - Protocol

protocol HomeCoordinating{
    
}

final class HomeCoordinator: HomeCoordinating {
    
    // MARK: - Properties
    
    weak var navigationController: UINavigationController?
    var presenter: HomePresenting?
    
    // MARK: - Navigation Methods
}
