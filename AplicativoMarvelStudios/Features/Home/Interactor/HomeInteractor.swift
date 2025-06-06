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
        presenter?.showLoading()
        service?.fetchCharacters(completion: { [weak self] result in
            switch result{
            case .success(let characters):
                self?.presenter?.presentCharacters(characters)
            case .failure(let error):
                self?.presenter?.showAlertError()
            }
        })
    }
}
