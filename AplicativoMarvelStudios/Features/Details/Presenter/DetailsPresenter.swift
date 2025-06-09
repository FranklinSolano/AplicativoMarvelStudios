//
//  DetailsPresenter.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

import UIKit

//MARK: - Protocol

protocol DetailsPresenting: AnyObject {
    func navigateBack()
    func getDetailsPerson(result: HeroesModel)
    func showResultAlertError(title: String, message: String)
    func showLoading()
    func hideLoading()
    func updateDetails(id: HeroesModel, data: [HeroesModel])
}

//MARK: - DetailsPresenter

final class DetailsPresenter {
    
    // MARK: - Properties
    
    weak  var view: DetailsViewControllerDisplay?
    private var coordinator: DetailsCoordinating?
    
    // MARK: - Init
    
    init(view: DetailsViewControllerDisplay, coordinator: DetailsCoordinating) {
        self.view = view
        self.coordinator = coordinator
    }
}

// MARK: - DetailsPresenting

extension DetailsPresenter: DetailsPresenting {
    func updateDetails(id: HeroesModel, data: [HeroesModel]) {
        coordinator?.updateDetails(id: id, data: data)
    }
    
    func showLoading() {
        view?.showLoading()
    }
    
    func hideLoading() {
        view?.hideLoading()
    }
    
    func showResultAlertError(title: String, message: String) {
        view?.showResultAlertError(title: title, message: message)
    }
    
    func getDetailsPerson(result: HeroesModel) {
        view?.getResutDataPerson(data: result)
    }
    
    func navigateBack() {
        coordinator?.navigateBack()
    }
}
