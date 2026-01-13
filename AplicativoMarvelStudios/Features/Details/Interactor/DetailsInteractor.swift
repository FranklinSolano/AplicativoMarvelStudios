//
//  DetailsInteractor.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

import UIKit

// MARK: - DetailsInteracting

protocol DetailsInteracting {
    func navigateBack()
    func fetchDetailsPerson(idPerson: Int)
    func updateDetails(id: SHCharacter, data: [SHCharacter])
}

// MARK: - DetailsInteractor

final class DetailsInteractor {
    
    // MARK: - Properties
    var presenter: DetailsPresenting
    private var  dependenciesService: HasHttpServicesInterface
    
    // MARK: - Init
    
    init(presenter: DetailsPresenting, dependenciesService: HasHttpServicesInterface) {
        self.presenter = presenter
        self.dependenciesService = dependenciesService
    }
}

// MARK: - DetailsInteracting

extension DetailsInteractor: DetailsInteracting {
    
    func updateDetails(id: SHCharacter, data: [SHCharacter]) {
        Task {
            await presenter.updateDetails(id: id, data: data)
        }
    }
    
    func fetchDetailsPerson(idPerson: Int) {
        presenter.showLoading()
        
        let detailsService = dependenciesService.httpServices.makeDetailsService()
        
        detailsService.fetchCharacterDetail(id: idPerson, completion: { [weak self] result in
            guard let self else { return }
            
            Task {
                switch result {
                case .success(let hero):
                    self.presenter.getDetailsPerson(result: hero)
                case .failure:
                    self.presenter.showResultAlertError(
                        title: "Atenção",
                        message: "Erro ao buscar personagens. Tente novamente mais tarde!"
                    )
                }
            }
        })
    }
    
    func navigateBack() {
        Task {
            await presenter.navigateBack()
        }
    }
}
