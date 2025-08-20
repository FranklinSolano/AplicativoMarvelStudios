//
//  HomeCoordinator.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

// MARK: - Protocol
@MainActor
protocol HomeCoordinating {
    func navigateToDetail(character: RMCharacter, teste: [RMCharacter])
}

final class HomeCoordinator: HomeCoordinating {
    
    // MARK: - Properties
    weak var navigationController: UINavigationController?
    var presenter: HomePresenting?
    
    func navigateToDetail(character: RMCharacter,teste: [RMCharacter] ) {
                guard let navigationController else { return }
        
                let detailsFactory = DetailsFactory()
                let detailsVC = detailsFactory.make(navigationController: navigationController)
        
                // Aqui você passa o personagem selecionado para a tela de detalhes
                detailsVC.idPerson = character.id
        detailsVC.personListImage = teste   // ⚡ ajuste no DetailsViewController para receber RMCharacter
        
                navigationController.pushViewController(detailsVC, animated: true)
            }
    }

