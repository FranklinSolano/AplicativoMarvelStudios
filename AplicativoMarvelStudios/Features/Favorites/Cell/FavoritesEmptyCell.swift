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
    private let components: DesignSystemComponentsInterface
    
    private lazy var titleLabel = components.makeLabel()
    
    // MARK: - Init
    
     init(components: DesignSystemComponentsInterface) {
        self.components = components
         super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
