//
//  DetailsCoordinator.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//


import UIKit

protocol DetailsCoordinating {
    
}

final class DetailsCoordinator: DetailsCoordinating {
    
    // MARK: - Properties
    
    weak var navigationController: UINavigationController?
    var presenter: DetailsPresenting?
    
    // MARK: - Navigation Methods
}
