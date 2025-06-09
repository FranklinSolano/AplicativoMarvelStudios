//
//  DetailsInteractor.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

import UIKit

protocol DetailsInteracting: AnyObject {
    func navigateBack()
    func fetchDetailsPerson(idPerson: Int)
    func updateDetails(id: HeroesModel, data: [HeroesModel])
}

final class DetailsInteractor {
    
    weak var presenter: DetailsPresenting?
    private var  service: DetailsServicing?
    
    init(presenter: DetailsPresenting, service: DetailsServicing) {
        self.presenter = presenter
        self.service = service
    }
}

extension DetailsInteractor: DetailsInteracting {
    func updateDetails(id: HeroesModel, data: [HeroesModel]) {
        presenter?.updateDetails(id: id, data: data)
    }
    
    func fetchDetailsPerson(idPerson: Int) {
        presenter?.showLoading()
        service?.fetchCharacterDetail(id: idPerson, completion: { result in
            switch result {
            case .success(let hero):
                self.presenter?.getDetailsPerson(result: hero)
                print(hero)
            case.failure:
//                self.presenter?.navigateBack()
                print("deu ruim")
            }
        })
    }
    
    func navigateBack() {
        presenter?.navigateBack()
    }
    
    
}
