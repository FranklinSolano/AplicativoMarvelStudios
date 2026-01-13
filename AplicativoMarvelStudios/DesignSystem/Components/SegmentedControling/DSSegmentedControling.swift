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
        setupStyle()
        registerForTraitChanges()
        addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupStyle() {
        // Fundo transparente
        backgroundColor = .clear
        selectedSegmentTintColor = UIColor.white.withAlphaComponent(0.3) // leve destaque no selecionado

        // Texto
        updateSegmentTextColors()
    }

    private func registerForTraitChanges() {
        registerForTraitChanges([UITraitUserInterfaceStyle.self]) { (self: Self, _: UITraitCollection) in
            self.backgroundColor = .clear
            self.selectedSegmentTintColor = UIColor.white.withAlphaComponent(0.3)
            self.updateSegmentTextColors()
        }
    }

    private func updateSegmentTextColors() {
        let normalColor = UIColor.white.withAlphaComponent(0.7) // não selecionado
        let selectedColor = UIColor.white                        // selecionado

        let titleTextAttributesNormal: [NSAttributedString.Key: Any] = [
            .foregroundColor: normalColor
        ]
        let titleTextAttributesSelected: [NSAttributedString.Key: Any] = [
            .foregroundColor: selectedColor
        ]

        setTitleTextAttributes(titleTextAttributesNormal, for: .normal)
        setTitleTextAttributes(titleTextAttributesSelected, for: .selected)
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
        updateSegmentTextColors()
    }

    func onClick(_ action: @escaping (Int) -> Void) {
        self.onClickAction = action
    }

    @objc private func valueChanged() {
        onClickAction?(selectedSegmentIndex)
    }
}
