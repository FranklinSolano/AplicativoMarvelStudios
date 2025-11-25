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
        self.setupStyle()
    }

    private func setupStyle() {
        self.setTitleColor(dynamicButtonTextColor, for: .normal)
        self.backgroundColor = DSColors.secondaryColor
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    private var dynamicButtonTextColor: UIColor {
        return UIColor { trait in
            trait.userInterfaceStyle == .dark
            ? .white
            : .white     // Se quiser preto no light é só trocar aqui
        }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.setTitleColor(dynamicButtonTextColor, for: .normal)
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
