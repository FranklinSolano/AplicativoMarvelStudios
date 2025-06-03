//
//  HomeInteractor.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

// MARK: - Protocol

protocol HomeInteracting: AnyObject {
    func fetchHeroes()
}

// MARK: - Interactor

final class HomeInteractor{
    
    // MARK: - Properties
    
    weak var presenter: HomePresenting?
    private var service: HomeService?
    var teste: [HeroesModel] = [] 
    
    // MARK: - Init
    
    init(presenter: HomePresenting, service: HomeService) {
        self.presenter = presenter
        self.service = service
    }
    
    //MARK: - Outher Methods
}

//MARK: - HomeInteracting

extension HomeInteractor: HomeInteracting {
    func fetchHeroes() {
        let mockHeroes: [HeroesModel] = [HeroesModel(id: 1, heroName: "Homem Aranha", fullName: "Nome real: Peter Parker", imageURL: "Spiderman"),
                                       HeroesModel(id: 1, heroName: "Capitão América", fullName: "Nome real: Steve Rogers", imageURL: "capitaoAmerica")]
        presenter?.presentHeroes(heroes: mockHeroes)
    }
}
