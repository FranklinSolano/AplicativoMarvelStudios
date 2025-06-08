//
//  EmptyTableViewCell.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit
import SnapKit

// MARK: - PersonListTableViewCell

final class PersonListTableViewCell: UITableViewCell {
    
    static let identifier: String = "PersonListTableViewCell"
    
    // MARK: - UI Elements
    
    private lazy var imagePerson: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    private lazy var heroName: UILabel = {
        let label = DSLabel(text: "", textColor: DSColors.titleTextColor, font: DSFonts.subtitleSemibold16, numberOfLines: 0, textAlignment: .left)
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Outher Methods
    
    func setupCell(data: HeroesModel?){
        heroName.text = data?.heroName
        if let url = data?.imageURL {
            imagePerson.loadImage(from: url)
        }
    }
}

// MARK: - ViewCodeProtocol

extension PersonListTableViewCell: ViewCodeProtocol {
    func setupElements() {
        addSubview(imagePerson)
        addSubview(heroName)
    }
    
    func setupConstraints() {
        imagePerson.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.height.equalTo(95)
            make.width.equalTo(85)
        }
        
        heroName.snp.makeConstraints { make in
            make.leading.equalTo(imagePerson.snp.trailing).offset(15)
            make.centerY.equalTo(imagePerson.snp.centerY)
        }
        
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = DSColors.primaryColor
        selectionStyle = .none
    }
}
