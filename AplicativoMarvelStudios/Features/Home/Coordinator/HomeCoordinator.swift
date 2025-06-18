//
//  HomeCoordinator.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

// MARK: - Protocol

protocol HomeCoordinating{
    func navigateToDetail(data: [HeroesModel], idPerson: HeroesModel)
}

final class HomeCoordinator: HomeCoordinating {
    func navigateToDetail(data: [HeroesModel], idPerson: HeroesModel) {
        guard let navigationController else { return }
        let detailsFactory = DetailsFactory()
        let detailsVC = detailsFactory.make(navigationController: navigationController)
        detailsVC.idPerson = idPerson.id
        detailsVC.personListImage = data
        navigationController.pushViewController(detailsVC, animated: true)
    }
    
    func navigateToDetail() {
        guard let navigationController else { return }
        let detailsFactory = DetailsFactory()
        let detailsVC = detailsFactory.make(navigationController: navigationController)
        navigationController.pushViewController(detailsVC, animated: true)
       }
    
    // MARK: - Properties
    
    weak var navigationController: UINavigationController?
    var presenter: HomePresenting?
}
