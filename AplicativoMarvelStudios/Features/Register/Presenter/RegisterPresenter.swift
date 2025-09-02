//
//  RegisterPresenter.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 02/09/25.
//

import UIKit

protocol RegisterPresenting {
    
}

final class RegisterPresenter {
    weak var view: RegisterViewControllerDisplay?
    private var coordinator: RegisterCoordinating
    
    init(view: RegisterViewControllerDisplay? = nil, coordinator: RegisterCoordinating) {
        self.view = view
        self.coordinator = coordinator
    }
}

extension RegisterPresenter: RegisterPresenting {
    
}
