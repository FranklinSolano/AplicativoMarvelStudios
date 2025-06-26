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
    func navigateToDetail(data: [HeroesModel], idPerson: HeroesModel)
}

// MARK: - Interactor

final class HomeInteractor{
    
    // MARK: - Properties
    
    var presenter: HomePresenting? //weak
    private var service: HomeService?
    
    // MARK: - Init
    
    init(presenter: HomePresenting, service: HomeService) {
        self.presenter = presenter
        self.service = service
    }
    
    //MARK: - Outher Methods
}

//MARK: - HomeInteracting

extension HomeInteractor: HomeInteracting {
    func navigateToDetail(data: [HeroesModel], idPerson: HeroesModel) {
        Task { @MainActor in
            presenter?.navigateToDetail(data: data, idPerson: idPerson)
        }
    }
    
    func fetchHeroes() {
        Task {
            await MainActor.run {
                presenter?.showLoading()
            }
            
            service?.fetchCharacters { [ weak self] result in
                guard let self = self else { return }
                
                Task { @MainActor in
                    switch result {
                    case .success(let characters):
                        self.presenter?.presentCharacters(characters)
                    case .failure:
                        self.presenter?.showAlertError()
                    }
                }
            }
        }
    }
}
