//
//  DetailsInteractor.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

import UIKit

//MARK: - DetailsInteracting

protocol DetailsInteracting {
    func navigateBack()
    func fetchDetailsPerson(idPerson: Int)
    func updateDetails(id: HeroesModel, data: [HeroesModel])
}

//MARK: - DetailsInteractor

final class DetailsInteractor {
    
    //MARK: - Properties
    var presenter: DetailsPresenting
    private var  dependencies: HasHttpServicesInterface
    
    //MARK: - Init
    
    init(presenter: DetailsPresenting, dependencies: HasHttpServicesInterface) {
        self.presenter = presenter
        self.dependencies = dependencies
    }
}

//MARK: - DetailsInteracting

extension DetailsInteractor: DetailsInteracting {
    
    func updateDetails(id: HeroesModel, data: [HeroesModel])  {
        Task {
            await presenter.updateDetails(id: id, data: data)
        }
    }
    
    func fetchDetailsPerson(idPerson: Int)  {
        presenter.showLoading()
        
        let detailsService = dependencies.httpServices.makeDetailsService()
        
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
    
    func navigateBack()  {
        Task {
            await presenter.navigateBack()
        }
        
    }
}
