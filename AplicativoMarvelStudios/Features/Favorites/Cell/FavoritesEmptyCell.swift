//
//  FavoritesEmptyCell.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 22/06/25.
//
import UIKit
import SnapKit

final class FavoritesEmptyCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier: String = "FavoritesEmptyCell"
    
    private let titleLabel: Labeling
    
    // MARK: - Init
    
    init(
        titleLabel: Labeling = DSLabelAdapter(
            text: "You don't have any favorites yet 🙁",
            textColor: DSColors.titleTextColor,
            font: DSFonts.titleBold22,
            numberOfLines: 0,
            textAlignment: .center
        )
    ) {
        self.titleLabel = titleLabel
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FavoritesEmptyCell: ViewCodeProtocol {
    
    func setupElements() {
        contentView.addSubview(titleLabel.view)
    }
    
    func setupConstraints() {
        titleLabel.view.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(40)
        }
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .clear
    }
}
