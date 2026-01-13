//
//  DSButtonImageAdapters.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 22/07/25.
import UIKit

// MARK: - DSButtonImageAdapter

final class DSButtonImageAdapter: UIButton, ButtonImageing {

    private var onClickAction: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.clipsToBounds = true
        self.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        registerForTraitChanges()
    }

    private func registerForTraitChanges() {
        registerForTraitChanges([UITraitUserInterfaceStyle.self]) { (self: Self, _: UITraitCollection) in
            // Mantém apenas o tintColor dinâmico se precisar mudar
            // Por enquanto, usa preto como padrão de elementos
            self.tintColor = DSColors.secondaryColor
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setDTO(_ dto: ImageButtonDTO) {
        self.setImage(dto.image, for: .normal)
        self.tintColor = dto.tintColor ?? DSColors.secondaryColor
        self.isEnabled = dto.isEnable
        self.alpha = dto.isEnable ? 1 : 0.5
    }

    func onClick(_ action: @escaping () -> Void) {
        self.onClickAction = action
    }

    @objc private func didTap() {
        onClickAction?()
    }
}
