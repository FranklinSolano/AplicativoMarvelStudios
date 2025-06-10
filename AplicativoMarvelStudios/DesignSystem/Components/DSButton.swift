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
        self.backgroundColor = DSColors.secundaryColor
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
        self.isEnabled = true
        self.alpha = 05
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class DSButtonTitles: UIButton {
    
    init(title: String, font: UIFont) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(DSColors.titleTextColor, for: .normal)
        self.titleLabel?.font = font
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
