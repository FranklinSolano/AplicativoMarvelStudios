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
    
    private lazy var titleLabel: UILabel = {
        let label = DSLabel(text: "You don't have any favorites yet 🙁", textColor: DSColors.titleTextColor, font: DSFonts.titleBold22, numberOfLines: 0, textAlignment: .center)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FavoritesEmptyCell: ViewCodeProtocol {
    func setupElements() {
        contentView.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.leading.trailing.edges.equalToSuperview().inset(40)
        }
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .clear
    }
    
    
    
}
