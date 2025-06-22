//
//  FavoritesView.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 09/06/25.
//

import UIKit
import SnapKit

//MARK: - FavoritesScreen

final class FavoritesScreen: UIView {
    
    private var titleLabel: UILabel = {
        let label = DSLabel(text: "Favorites Characters", textColor: DSColors.titleTextColor, font: DSFonts.titleBold22, numberOfLines: 0, textAlignment: .center)
        return label
    }()
    
    lazy var collectionViewFavorites: UICollectionView = {
        let collectionView = DSCollectionView(scroll: .vertical, spacing: 30)
        collectionView.register(FavoritesEmptyCell.self, forCellWithReuseIdentifier:  FavoritesEmptyCell.identifier)
        collectionView.register(FavoritesListCharactersCell.self, forCellWithReuseIdentifier:  FavoritesListCharactersCell.identifier)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCollectoinView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource){
        collectionViewFavorites.delegate = delegate
        collectionViewFavorites.dataSource = dataSource
    }
    
}

//MARK: - ViewCodeProtocol

extension FavoritesScreen: ViewCodeProtocol {
    func setupElements() {
        addSubview(titleLabel)
        addSubview(collectionViewFavorites)
    }
    
    func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(25)
            make.centerX.equalToSuperview()
        }
        
        collectionViewFavorites.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(35)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = DSColors.primaryColor
        
    }
}
