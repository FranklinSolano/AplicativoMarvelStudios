//
//  HomeCoordinator.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin Stilhano Solano on 28/05/25.
//

import UIKit

// MARK: - Protocol
@MainActor
protocol HomeCoordinating {
    func navigateToDetail(character: SHCharacter, randomCharacters: [SHCharacter])
}

final class HomeCoordinator: HomeCoordinating {
    
    // MARK: - Properties
    weak var navigationController: UINavigationController?
    var presenter: HomePresenting?
    
    func navigateToDetail(character: SHCharacter, randomCharacters: [SHCharacter]) {
        print("🔵 HomeCoordinator: navigateToDetail chamado")
        print("🔵 Character ID: \(character.id)")
        print("🔵 Character Name: \(character.name)")
        
        guard let navigationController else {
            print("🔴 ERRO: navigationController está NIL!")
            return
        }
        
        print("🔵 navigationController OK")
        
        let detailsFactory = DetailsFactory()
        let detailsVC = detailsFactory.make(navigationController: navigationController)
        
        print("🔵 DetailsVC criado")
        
        detailsVC.idPerson = character.id
        detailsVC.personListImage = randomCharacters
        
        print("🔵 Dados setados no DetailsVC")
        print("🔵 Tentando fazer push...")
        
        navigationController.pushViewController(detailsVC, animated: true)
        
        print("✅ Push executado!")
    }
}
