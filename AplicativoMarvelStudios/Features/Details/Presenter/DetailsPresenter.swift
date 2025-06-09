//
//  DetailsPresenter.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

import UIKit

protocol DetailsPresenting: AnyObject {
    func navigateBack()
    func getDetailsPerson(result: HeroesModel)
    func showResultAlertError(title: String, message: String)
    func showLoading()
    func hideLoading()
}

final class DetailsPresenter {
    
    weak  var view: DetailsViewControllerDisplay?
     private var coordinator: DetailsCoordinating?
     
     init(view: DetailsViewControllerDisplay, coordinator: DetailsCoordinating) {
         self.view = view
         self.coordinator = coordinator
     }
}

extension DetailsPresenter: DetailsPresenting {
    func showLoading() {
        view?.showLoading()
    }
    
    func hideLoading() {
        view?.hideLoading()
    }
    
    func showResultAlertError(title: String, message: String) {
        
    }
    
    func getDetailsPerson(result: HeroesModel) {
        view?.getResutDataPerson(data: result)
    }
    
    func navigateBack() {
        coordinator?.navigateBack()
    }
    
  
}
