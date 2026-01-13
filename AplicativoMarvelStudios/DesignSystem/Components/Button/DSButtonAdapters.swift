//
//  DSButtonAdapters.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 22/07/25.
//
import UIKit

// MARK: - DSButtonAdapter

final class DSButtonAdapter: DSButton, Buttoning {
    private var onClickAction: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(didTap), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setDTO(_ dto: ButtonDTO) {
        self.setTitle(dto.title, for: .normal)
        self.isEnabled = dto.isEnable
        self.alpha = dto.isEnable ? 1 : 0.5
        if let font = dto.font {
            self.titleLabel?.font = font
        }
    }

    func onClick(_ action: @escaping () -> Void) {
        self.onClickAction = action
    }

    @objc private func didTap() {
        onClickAction?()
    }
}

// MARK: - DSButtonTitlesAdapter

final class DSButtonTitlesAdapter: DSButtonTitles, Buttoning {
    private var onClickAction: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(didTap), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setDTO(_ dto: ButtonDTO) {
        self.setTitle(dto.title, for: .normal)
        self.isEnabled = dto.isEnable
        self.alpha = dto.isEnable ? 1 : 0.5
        if let font = dto.font {
            self.titleLabel?.font = font
        }
    }

    func onClick(_ action: @escaping () -> Void) {
        self.onClickAction = action
    }

    @objc private func didTap() {
        onClickAction?()
    }
}
