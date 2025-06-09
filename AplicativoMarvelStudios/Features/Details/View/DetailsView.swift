//
//  DetailsView.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

import UIKit
import SnapKit

// MARK: - Protocol

protocol DetailsViewProtocol: AnyObject {
    func actionBack()
}

// MARK: - DetailsView

final class DetailsView: UIView {
    
    weak var delegate: DetailsViewProtocol?
    
    // MARK: - UI Elements
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("<- Voltar", for: .normal)
        button.setTitleColor(DSColors.titleTextColor, for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var imagePerson: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 17
        return imageView
    }()
    
    private lazy var personName: UILabel = {
        let label = DSLabel(text: "", textColor: DSColors.titleTextColor, font: DSFonts.subtitleSemibold16, numberOfLines: 0, textAlignment: .center)
        return label
    }()
    
     lazy var descriptionPerson: UILabel = {
        let label = DSLabel(text: "", textColor: DSColors.titleTextColor, font: DSFonts.captionLight14, numberOfLines: 0, textAlignment: .left)
        return label
    }()
    
    private lazy var personRelated: UILabel = {
        let label = DSLabel(text: "Mais Personagens", textColor: DSColors.titleTextColor, font: DSFonts.subtitleSemibold16, numberOfLines: 0, textAlignment: .left)
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(PersonListCollectionViewCell.self, forCellWithReuseIdentifier:  PersonListCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        indicator.color = DSColors.titleTextColor // Ou qualquer cor que combine com seu tema
        return indicator
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc private func tappedBackButton(){
        delegate?.actionBack()
    }
    
    // MARK: - Outher Methods
    
    func configCollectoinView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource){
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    func setupView(data: HeroesModel?) {
        personName.text = data?.heroName
        if let description = data?.descrepitionPerson, !description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            descriptionPerson.text = description
        } else {
            descriptionPerson.text = "Descrição do personagem não encontrada"
        }
        if let url = data?.imageURL {
            imagePerson.loadImage(from: url)
        }
    }
    
    func showLoading() {
        activityIndicator.startAnimating()
        collectionView.isHidden = true
        personRelated.isHidden = true
    }
    
    func hideLoading() {
        activityIndicator.stopAnimating()
        collectionView.isHidden = false
        personRelated.isHidden = false
    }
}

//MARK: - ViewCodeProtocol

extension DetailsView: ViewCodeProtocol {
    func setupElements() {
        addSubview(backButton)
        addSubview(personName)
        addSubview(imagePerson)
        addSubview(descriptionPerson)
        addSubview(personRelated)
        addSubview(collectionView)
        addSubview(activityIndicator)
    }
    
    func setupConstraints() {
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(25)
        }
        
        personName.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(25)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        imagePerson.snp.makeConstraints { make in
            make.top.equalTo(personName.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.snp.width).multipliedBy(0.6) // altura proporcional à largura (aspect ratio 3:5 por exemplo)
        }
        
        descriptionPerson.snp.makeConstraints { make in
            make.top.equalTo(imagePerson.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        personRelated.snp.makeConstraints { make in
            make.top.equalTo(descriptionPerson.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(personRelated.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview().inset(10)
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = DSColors.primaryColor
    }
    
}

//MARK: - DetailsViewProtocol

extension DetailsView: DetailsViewProtocol {
    func actionBack() {
        delegate?.actionBack()
    }
}
