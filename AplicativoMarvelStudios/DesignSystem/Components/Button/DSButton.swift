//
//  DSButton.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 29/05/25.
//

import UIKit

// MARK: - DSButton

class DSButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupStyle()
        registerForTraitChanges()
    }

    private func setupStyle() {
        setTitleColor(dynamicButtonTextColor, for: .normal)
        backgroundColor = DSColors.secondaryColor
        clipsToBounds = true
        layer.cornerRadius = 15
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func registerForTraitChanges() {
        registerForTraitChanges([UITraitUserInterfaceStyle.self]) { (self: Self, _: UITraitCollection) in
            self.setTitleColor(self.dynamicButtonTextColor, for: .normal)
        }
    }

    private var dynamicButtonTextColor: UIColor {
        return UIColor { trait in
            trait.userInterfaceStyle == .dark ? .white : .black
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - DSButtonTitles

class DSButtonTitles: UIButton {
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupStyle()
    }
    
    private func setupStyle() {
        setTitleColor(DSColors.titleTextColor, for: .normal)
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
