//
//  HomeCoordinator.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

protocol HomeCoordinating{
    
}

final class HomeCoordinator: HomeCoordinating {
    
    weak var navigationController: UINavigationController?
    var presenter: HomePresenting?
    
}
