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
    
    
    // MARK: - Init
    
    init(presenter: HomePresenting, service: HomeService) {
        self.presenter = presenter
        self.service = service
    }
    
    //MARK: - Outher Methods
    
 
}

extension HomeInteractor: HomeInteracting {
    func fetchHeroes() {
        let mockHeroes: [HomeModel] = [HomeModel(id: 1, heroName: "Homem Aranha", fullName: "Peter Parker", imageURL: "Spiderman"),
                                       HomeModel(id: 1, heroName: "Capitao America", fullName: "Steve Rogers", imageURL: "Spiderman")]
        presenter?.presentHeroes(heroes: mockHeroes)
    }
    
    
}
