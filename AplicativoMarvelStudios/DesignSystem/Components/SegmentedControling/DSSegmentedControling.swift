//
//  DSSegmentedControling.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 16/07/25.
//

import UIKit

// MARK: - Protocol

protocol SegmentedControling: UIView {
    var selectedSegmentIndex: Int { get set }
    func setItems(_ items: [String])
    func onClick(_ action: @escaping (Int) -> Void)
}

// MARK: - DSSegmentedControlAdapter

final class DSSegmentedControlAdapter: UISegmentedControl, SegmentedControling {

    private var onClickAction: ((Int) -> Void)?

    init(items: [String] = []) {
        super.init(items: items)
        addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setItems(_ items: [String]) {
        removeAllSegments()
        for (index, title) in items.enumerated() {
            insertSegment(withTitle: title, at: index, animated: false)
        }
        selectedSegmentIndex = 0
    }

    func onClick(_ action: @escaping (Int) -> Void) {
        self.onClickAction = action
    }

    @objc private func valueChanged() {
        onClickAction?(selectedSegmentIndex)
    }
}
