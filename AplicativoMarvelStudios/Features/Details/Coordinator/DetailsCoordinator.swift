//
//  DetailsCoordinator.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//


import UIKit

//MARK: - DetailsCoordinating
@MainActor
protocol DetailsCoordinating {
    func navigateBack()
    func updateDetails(id: RMCharacter, data: [RMCharacter])
}

// MARK: - DetailsCoordinating

final class DetailsCoordinator: DetailsCoordinating {
    
    // MARK: - Properties
    
    weak var navigationController: UINavigationController?
    var presenter: DetailsPresenting?
    
    // MARK: - Navigation Methods
    
    func updateDetails(id: RMCharacter, data: [RMCharacter]) {
        guard let navigationController else { return }
        let detailsFactory = DetailsFactory()
        let detailsVC = detailsFactory.make(navigationController: navigationController)
        detailsVC.idPerson = id.id
        detailsVC.personListImage = data
        navigationController.pushViewController(detailsVC, animated: true)
    }
    
    func navigateBack() {
        navigationController?.popToRootViewController(animated: true)
    }
}
