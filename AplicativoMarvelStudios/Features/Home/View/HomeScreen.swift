//
//  HomeScreen.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit
import SnapKit

// MARK: - HomeScreen

final class HomeScreen: UIView {
    
    // MARK: - UI Elements
    
    let userName: Labeling
    let searchPerson: SearchBaring
    let descriptionName: Labeling
    let tableView: TableViewing
    let activityIndicator: LoadingIndicatable
    
    // MARK: - Init
    
    init(userName: Labeling = DSLabelAdapter(),
         searchPerson: SearchBaring = DSSearchBarAdapter(),
         descriptionName: Labeling = DSLabelAdapter(),
         tableView: TableViewing = DSTableViewAdapter(),
         activityIndicator: LoadingIndicatable = DSActivityIndicatorAdapter()) {
        
        self.userName = userName
        self.searchPerson = searchPerson
        self.descriptionName = descriptionName
        self.tableView = tableView
        self.activityIndicator = activityIndicator
        
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabels(){
        userName.setDTO(.init(text: "Hi, Solas",
                              textColor: DSColors.titleTextColor,
                              font: DSFonts.titleBold18,
                              numberOfLines: 0,
                              textAlignment: .center))
        
        descriptionName.setDTO(.init(text: "Marvel Characters",
                                     textColor: DSColors.titleTextColor,
                                     font: DSFonts.titleBold22))
    }
    
    
    // MARK: - Outher Methods
    
    func configTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    private func registerCells() {
        tableView.register(PersonListTableViewCell.self, forCellReuseIdentifier: PersonListTableViewCell.identifier)
    }
    
    func showLoading() {
        activityIndicator.startAnimating()
        tableView.isHidden = true
    }
    
    func hideLoading() {
        activityIndicator.stopAnimating()
        tableView.isHidden = false
    }
}

// MARK: - ViewCodeProtocol

extension HomeScreen: ViewCodeProtocol {
    func setupElements() {
           addSubview(userName)
           addSubview(searchPerson)
           addSubview(descriptionName)
           addSubview(tableView)
           addSubview(activityIndicator)
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

           activityIndicator.snp.makeConstraints { make in
               make.center.equalToSuperview()
           }
       }
    
    func setupAdditionalConfiguration() {
        backgroundColor = DSColors.primaryColor
        registerCells()
        configureLabels()
    }
}
