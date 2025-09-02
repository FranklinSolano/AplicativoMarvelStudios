//
//  RegisterScreen.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 02/09/25.
//

import UIKit

final class RegisterScreen: UIView {
    
    private let dependencies: HasDesignSystemComponentsInterface
    
    init(dependencies: HasDesignSystemComponentsInterface) {
        self.dependencies = dependencies
        super.init(frame: .zero)
        setupView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RegisterScreen: ViewCodeProtocol {
    func setupElements() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupAdditionalConfiguration() {
        
    }
    
    
}
