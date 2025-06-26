//
//  FavoritesCoordinator.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 09/06/25.
//

import UIKit


//MARK: - FAvoritesCoordinating
@MainActor 
protocol FavoritesCoordinating {
    func navigateDetails(id: HeroesModel, data: [HeroesModel])
}

// MARK: - FavoritesCoordinating

final class FavoritesCoordinator: FavoritesCoordinating {
    
    // MARK: - Properties
    
    var navigationController: UINavigationController? //weak
    var presenter: FavoritesPresenting?
    
    // MARK: - Navigation Methods
    
   func navigateDetails(id: HeroesModel, data: [HeroesModel]) {
        guard let navigationController else { return }
        let detailsFactory = DetailsFactory()
        let detailsVC = detailsFactory.make(navigationController: navigationController)
        detailsVC.idPerson = id.id
        detailsVC.personListImage = data
        navigationController.pushViewController(detailsVC, animated: true)
    }
}
