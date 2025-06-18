//
//  FavoritesView.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 09/06/25.
//

import UIKit

//MARK: - FavoritesScreen

final class FavoritesScreen: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - ViewCodeProtocol

extension FavoritesScreen: ViewCodeProtocol {
    func setupElements() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupAdditionalConfiguration() {
        
    }
}
