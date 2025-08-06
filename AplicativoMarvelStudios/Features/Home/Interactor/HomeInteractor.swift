//
//  HomeInteractor.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

// MARK: - Protocol

protocol HomeInteracting {
    func fetchHeroes()
    func navigateToDetail(data: [HeroesModel], idPerson: HeroesModel)
}

// MARK: - Interactor

final class HomeInteractor{
    
    // MARK: - Properties
    
    var presenter: HomePresenting
    private let dependenciesService: HasHttpServicesInterface
    
    // MARK: - Init
    
    init(presenter: HomePresenting, dependenciesService: HasHttpServicesInterface) {
        self.presenter = presenter
        self.dependenciesService = dependenciesService
    }
    
    //MARK: - Outher Methods
}

//MARK: - HomeInteracting

extension HomeInteractor: HomeInteracting {
    func navigateToDetail(data: [HeroesModel], idPerson: HeroesModel) {
        Task {
            await presenter.navigateToDetail(data: data, idPerson: idPerson)
        }
    }
    
    func fetchHeroes() {
        Task {
            await MainActor.run {
                presenter.showLoading()
            }
            let homeService = dependenciesService.httpServices.makeHomeService()
            
            homeService.fetchCharacters { [ weak self] result in
                guard let self = self else { return }
                
                Task { @MainActor in
                    switch result {
                    case .success(let characters):
                        self.presenter.presentCharacters(characters)
                    case .failure:
                        self.presenter.showAlertError()
                    }
                }
            }
        }
    }
}
