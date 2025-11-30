//
//  ListCharactersCollectionViewCell.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 22/06/25.
//

import UIKit

// MARK: - ListCharactersCollectionViewCell

final class ListCharactersCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier: String = "ListCharactersCollectionViewCell"
    private let dependencies: HasDesignSystemComponentsInterface
    
    private lazy var imagePerson = dependencies.designSystemComponents.makeImageView()
    
    // MARK: - Init com injeção
    
    override init(frame: CGRect) {
        self.dependencies = DependencyContainer() // ou sua dependência padrão
        super.init(frame: frame)
        setupView()
    }
    
    init(dependencies: HasDesignSystemComponentsInterface) {
        self.dependencies = dependencies
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Method
    
    func setupCell(data: SHCharacter?) {
        imagePerson.setImage(from: data?.images.lgImage)
    }
}

// MARK: - ViewCodeProtocol

extension ListCharactersCollectionViewCell: ViewCodeProtocol {
    
    func setupElements() {
        contentView.addSubview(imagePerson)
    }
    
    func setupConstraints() {
        imagePerson.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .clear
    }
}
