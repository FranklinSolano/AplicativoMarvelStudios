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
    
    private let titleLabel: Labeling = DSLabelAdapter()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func configureLabels(){
        titleLabel.setDTO(.init(
            text: "You don't have any favorites yet 🙁",
            textColor: DSColors.titleTextColor,
            font: DSFonts.titleBold22,
            numberOfLines: 0,
            textAlignment: .center
        ))
    }
    
}

extension FavoritesEmptyCell: ViewCodeProtocol {
    
    func setupElements() {
        contentView.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(40)
        }
    }
    
    func setupAdditionalConfiguration() {
        configureLabels()
        backgroundColor = .clear
    }
}
