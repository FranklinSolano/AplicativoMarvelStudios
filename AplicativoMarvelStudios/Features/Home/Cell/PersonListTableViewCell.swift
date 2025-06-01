//
//  EmptyTableViewCell.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit
import SnapKit

class PersonListTableViewCell: UITableViewCell {
    
    static let identifier: String = "PersonListTableViewCell"
    
    private lazy var imagePerson: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Spiderman")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [heroName, fullName])
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .leading
        return stack
    }()
    
    private lazy var heroName: UILabel = {
        let label = DSLabel(text: "Homem-Aranha", textColor: DSColors.titleTextColor, font: DSFonts.subtitleSemibold16, numberOfLines: 0, textAlignment: .left)
        return label
    }()
    
    private lazy var fullName: UILabel = {
        let label = DSLabel(text: "Nome real: Peter Parker", textColor: DSColors.descriptionTextColor, font: DSFonts.captionLight14, numberOfLines: 0, textAlignment: .left)
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(data: HomeModel?){
        heroName.text = data?.heroName
        fullName.text = data?.fullName
        imagePerson.image = UIImage(named: data?.imageURL ?? "")
    }
    
}

extension PersonListTableViewCell: ViewCodeProtocol {
    func setupElements() {
        addSubview(imagePerson)
        addSubview(infoStackView)
    }
    
    func setupConstraints() {
        imagePerson.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.height.equalTo(95)
            make.width.equalTo(85)
        }
        
        infoStackView.snp.makeConstraints { make in
            make.leading.equalTo(imagePerson.snp.trailing).offset(16)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(15)
        }
        
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = DSColors.primaryColor
        selectionStyle = .none
    }
}
