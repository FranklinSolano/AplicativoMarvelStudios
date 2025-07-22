//
//  FavoritesView.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 09/06/25.
//

import UIKit
import SnapKit

final class FavoritesScreen: UIView {
    
    // MARK: - UI Elements
    
    let titleLabel: Labeling
    let collectionViewFavorites: CollectionViewing

    // MARK: - Init
    
    init(titleLabel: Labeling = DSLabelAdapter(),
         collectionViewFavorites: CollectionViewing = DSCollectionViewAdapter(scroll: .vertical, spacing: 10)) {
        
        self.titleLabel = titleLabel
        self.collectionViewFavorites = collectionViewFavorites
        
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods
    
    private func configureLabels(){
        titleLabel.setDTO(.init(text: "Favorites Characters",
                                textColor: DSColors.titleTextColor,
                                font: DSFonts.titleBold22,
                                numberOfLines: 0,
                                textAlignment: .center))
    }
    
    func configCollectoinView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        collectionViewFavorites.delegate = delegate
        collectionViewFavorites.dataSource = dataSource
    }
    
    private func registerCells(){
        collectionViewFavorites.register(FavoritesEmptyCell.self, forCellWithReuseIdentifier: FavoritesEmptyCell.identifier)
        collectionViewFavorites.register(ListCharactersCollectionViewCell.self, forCellWithReuseIdentifier: ListCharactersCollectionViewCell.identifier)
    }
}


// MARK: - ViewCodeProtocol

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
        configureLabels()
        backgroundColor = DSColors.primaryColor
        registerCells()
      
    }
}
