//
//  DSButton.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 29/05/25.
//

import UIKit

final class DSButton: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(DSColors.titleTextColor, for: .normal)
        self.backgroundColor = .clear
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 3
        self.layer.borderColor = DSColors.secundaryColor.cgColor
        self.isEnabled = true
        self.alpha = 05
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
