//
//  HomeCoordinator.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

// MARK: - Protocol
@MainActor
protocol HomeCoordinating{
    func navigateToDetail(data: [HeroesModel], idPerson: HeroesModel)
}

final class HomeCoordinator: HomeCoordinating {
    
    // MARK: - Properties
    
    var navigationController: UINavigationController? //weak
    var presenter: HomePresenting?

    
    func navigateToDetail(data: [HeroesModel], idPerson: HeroesModel) {
        guard let navigationController else { return }
            let detailsFactory = DetailsFactory()
            let detailsVC = detailsFactory.make(navigationController: navigationController)
            detailsVC.idPerson = idPerson.id
            detailsVC.personListImage = data
            navigationController.pushViewController(detailsVC, animated: true)
    }
}
