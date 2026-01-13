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
        // Fundo do botão -> secundário
        backgroundColor = DSColors.secondaryColor
        clipsToBounds = true
        layer.cornerRadius = 15
        translatesAutoresizingMaskIntoConstraints = false

        // Cor do texto do botão -> branco dinâmico
        setTitleColor(DSColors.textWhiteColor, for: .normal)
    }

    private func registerForTraitChanges() {
        // Atualiza cores automaticamente ao mudar o tema
        registerForTraitChanges([UITraitUserInterfaceStyle.self]) { (self: Self, _: UITraitCollection) in
            self.backgroundColor = DSColors.secondaryColor
            self.setTitleColor(DSColors.textWhiteColor, for: .normal)
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
        registerForTraitChanges()
    }

    private func setupStyle() {
        // Botão transparente
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false

        // Cor do título
        setTitleColor(DSColors.titleTextColor, for: .normal)
    }

    private func registerForTraitChanges() {
        registerForTraitChanges([UITraitUserInterfaceStyle.self]) { (self: Self, _: UITraitCollection) in
            self.setTitleColor(DSColors.titleTextColor, for: .normal)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
