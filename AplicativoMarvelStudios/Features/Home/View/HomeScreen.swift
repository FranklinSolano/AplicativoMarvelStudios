//
//  HomeScreen.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit
import SnapKit

protocol HomeScreenProtocol: AnyObject {
    
}


final class HomeScreen: UIView {
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension HomeScreen: ViewCodeProtocol {
    func setupElements() {
                
    }
    
    func setupConstraints() {
            
    }
    
    func setupAdditionalConfiguration() {
        
    }
    
    
}
