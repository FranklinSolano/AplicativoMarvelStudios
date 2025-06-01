//
//  HomeScreen.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit
import SnapKit

// MARK: - Protocol

protocol HomeScreenProtocol: AnyObject {
    
}

// MARK: - HomeScreen

final class HomeScreen: UIView {
    
    // MARK: - UI Elements
    
    private lazy var userName: UILabel = {
        let label = DSLabel(text: "Hi, Solas", textColor: DSColors.titleTextColor, font: DSFonts.titleBold18, numberOfLines: 0, textAlignment: .center)
        return label
    }()
    
    private lazy var searchPerson: UISearchBar = {
        let searchBar = DSSearchBar()
        return searchBar
    }()
    
    private lazy var descriptionName: UILabel = {
        let label = DSLabel(text: "Marvel Characters", textColor: DSColors.titleTextColor, font: DSFonts.titleBold22, numberOfLines: 0, textAlignment: .left)
        return label
    }()
    
     lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.register(PersonListTableViewCell.self, forCellReuseIdentifier: PersonListTableViewCell.identifier)
        return tableView
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
    
    func configTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
}


// MARK: - ViewCodeProtocol

extension HomeScreen: ViewCodeProtocol {
    func setupElements() {
        addSubview(userName)
        addSubview(searchPerson)
        addSubview(descriptionName)
        addSubview(tableView)
    }
    
    func setupConstraints() {
        userName.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
        }
        
        searchPerson.snp.makeConstraints { make in
            make.top.equalTo(userName.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
        
        descriptionName.snp.makeConstraints { make in
            make.top.equalTo(searchPerson.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(descriptionName.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = DSColors.primaryColor
    }
}
