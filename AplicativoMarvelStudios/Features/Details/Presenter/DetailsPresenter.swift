//
//  DetailsPresenter.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

import UIKit

protocol DetailsPresenting: AnyObject {
    
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
  
}
