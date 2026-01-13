//
//  FavoritesView.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 09/06/25.
//
import SnapKit
import UIKit

final class FavoritesScreen: UIView {
    
    // MARK: - UI Elements
    private let dependencies: HasDesignSystemComponentsInterface
    private lazy var titleLabel = dependencies.designSystemComponents.makeLabel()
    private lazy var collectionViewFavorites = dependencies.designSystemComponents.makeCollectionView()

    // MARK: - Init
    
    init(dependencies: HasDesignSystemComponentsInterface) {
        self.dependencies = dependencies
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods
    
    private func configureLabels() {
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
    
    private func registerCells() {
        collectionViewFavorites.register(FavoritesEmptyCell.self,
                                         forCellWithReuseIdentifier: FavoritesEmptyCell.identifier)
        collectionViewFavorites.register(ListCharactersCollectionViewCell.self,
                                         forCellWithReuseIdentifier: ListCharactersCollectionViewCell.identifier)
    }
}

// MARK: - ViewCodeProtocol
extension FavoritesScreen: ViewCodeProtocol {
    func setupElements() {
        [titleLabel, collectionViewFavorites].forEach(addSubview)
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
