//
//  DSButton.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 29/05/25.
//

import UIKit

//MARK: - DSButton

class DSButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setTitleColor(DSColors.titleTextColor, for: .normal)
        self.backgroundColor = DSColors.secondaryColor
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - DSButtonTitles

class DSButtonTitles: UIButton {
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.setTitleColor(DSColors.titleTextColor, for: .normal)
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
