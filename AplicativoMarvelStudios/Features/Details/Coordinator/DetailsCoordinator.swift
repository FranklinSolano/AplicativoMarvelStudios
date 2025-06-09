//
//  DetailsCoordinator.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//


import UIKit

protocol DetailsCoordinating {
    func navigateBack()
    func updateDetails(id: HeroesModel, data: [HeroesModel])
}

final class DetailsCoordinator: DetailsCoordinating {
    func updateDetails(id: HeroesModel, data: [HeroesModel]) {
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
    
    
    // MARK: - Properties
    
    weak var navigationController: UINavigationController?
    var presenter: DetailsPresenting?
    
    // MARK: - Navigation Methods
}
