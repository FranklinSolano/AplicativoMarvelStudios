//
//  HomeInteractor.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

// MARK: - Protocol

protocol HomeInteracting {
    func fetchChracters()
    func navigateToDetail(character: RMCharacter, randomCharacters: [RMCharacter])
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
    
    func navigateToDetail(character: RMCharacter, randomCharacters: [RMCharacter]) {
        Task {
            await presenter.navigateToDetail(character: character, randomCharacters: randomCharacters)
        }
        
    }
    
    func fetchChracters() {
        Task {
            await MainActor.run {
                presenter.showLoading()
            }
            
            let homeService = dependenciesService.httpServices.makeHomeService()
            
            homeService.fetchCharacters { [weak self] result in
                guard let self = self else { return}
                
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
