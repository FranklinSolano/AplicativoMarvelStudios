//
//  DetailsView.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

import UIKit
import SnapKit

// MARK: - Protocol

protocol DetailsViewProtocol {
    
}

// MARK: - DetailsView

final class DetailsView: UIView {
    
    // MARK: - UI Elements
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Outher Methods
}

//MARK: - ViewCodeProtocol

extension DetailsView: ViewCodeProtocol {
    func setupElements() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupAdditionalConfiguration() {
        
    }
    
    
}

//MARK: - DetailsViewProtocol

extension DetailsView: DetailsViewProtocol {
    
}
