//
//  ListCharactersCollectionViewCell.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 22/06/25.
//

import UIKit

// MARK: - FavoritesListCharactersCell

final class ListCharactersCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier: String = "ListCharactersCollectionViewCell"
    
    // MARK: - UI Elements
    
    private lazy var imagePerson: UIImageView = {
        let imageView = DSImageView(image: .placeholder)
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
        if let urlString = data?.imageURL, let url = URL(string: urlString) {
            imagePerson.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"))
        } else {
            imagePerson.image = UIImage(named: "placeholder")
        }
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
    
    func setupAdditionalConfiguration() {}
}
