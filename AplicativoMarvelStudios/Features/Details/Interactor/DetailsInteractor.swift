//
//  DetailsInteractor.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

import UIKit

//MARK: - DetailsInteracting

protocol DetailsInteracting: AnyObject {
    func navigateBack()
    func fetchDetailsPerson(idPerson: Int)
    func updateDetails(id: HeroesModel, data: [HeroesModel])
}

//MARK: - DetailsInteractor

final class DetailsInteractor {
    
    //MARK: - Properties
    var presenter: DetailsPresenting? //weak
    private var  service: DetailsServicing?
    
    //MARK: - Init
    
    init(presenter: DetailsPresenting, service: DetailsServicing) {
        self.presenter = presenter
        self.service = service
    }
}

//MARK: - DetailsInteracting

extension DetailsInteractor: DetailsInteracting {
    func updateDetails(id: HeroesModel, data: [HeroesModel]) {
        Task { @MainActor in
            presenter?.updateDetails(id: id, data: data)
        }
        
    }
    
    func fetchDetailsPerson(idPerson: Int) {
        Task { @MainActor in
            presenter?.showLoading()
        }
        
        service?.fetchCharacterDetail(id: idPerson, completion: { [weak self] result in
                    guard let self else { return }
            Task { @MainActor in
                switch result {
                case .success(let hero):
                    self.presenter?.getDetailsPerson(result: hero)
                case.failure:
                    self.presenter?.showResultAlertError(title: "Atencao", message: "Erro ao buscar personagens. Tente Novamente mais tarde!")
                }
            }
            
        })
    }
    
    func navigateBack() {
        Task { @MainActor in
            presenter?.navigateBack()
        }
    }
}
