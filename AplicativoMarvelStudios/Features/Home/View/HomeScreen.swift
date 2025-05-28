//
//  HomeScreen.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit
import SnapKit

protocol HomeScreenProtocol: AnyObject {
    
}


final class HomeScreen: UIView {
    
    private lazy var userName: UILabel = {
        let label = UILabel()
        label.text = "Hi, Solas"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var searchPerson: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.clipsToBounds = true
        searchBar.layer.cornerRadius = 10
        searchBar.searchTextField.backgroundColor = UIColor(red: 38/255, green: 48/255, blue: 59/255, alpha: 1)
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(
            string: "Search Person",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        let textField = searchBar.searchTextField
        if let leftIconView = textField.leftView as? UIImageView {
            leftIconView.tintColor = .lightGray
        }
        return searchBar
    }()
    
    private lazy var descriptionName: UILabel = {
        let label = UILabel()
        label.text = "Marvel Characters"
        label.textColor = .white
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
}

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
            make.top.equalTo(userName.snp.bottom).offset(35)
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
        backgroundColor = UIColor(red: 20/255, green: 20/255, blue: 20/255, alpha: 1)
        
    }
    
    
}
