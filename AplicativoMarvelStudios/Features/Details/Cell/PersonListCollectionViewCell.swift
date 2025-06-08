//
//  PersonListCollectionViewCell.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 07/06/25.
//

import UIKit

// MARK: - PersonListCollectionViewCell

final class PersonListCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "PersonListCollectionViewCell"
    
    // MARK: - UI Elements
    
    private lazy var imagePerson: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Outher Methods
    
    func SetupCell(data: HeroesModel?){
        if let url = data?.imageURL {
            imagePerson.loadImage(from: url)
        }
    }
}

// MARK: - ViewCodeProtocol

extension PersonListCollectionViewCell: ViewCodeProtocol {
    func setupElements() {
        contentView.addSubview(imagePerson)
    }
    
    func setupConstraints() {
        imagePerson.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {}
}
