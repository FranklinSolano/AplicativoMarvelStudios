//
//  DS.TableView.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 16/07/25.
//

import UIKit

protocol TableViewing: AnyObject {
    var view: UIView { get }
    var delegate: UITableViewDelegate? { get set }
    var dataSource: UITableViewDataSource? { get set }
    func register(_ cellClass: AnyClass?, forCellReuseIdentifier identifier: String)
    func reloadData()
    var isHidden: Bool { get set }
}

final class DSTableViewAdapter: UITableView, TableViewing {
    var view: UIView { return self }

    init() {
        super.init(frame: .zero, style: .plain)
        backgroundColor = DSColors.secondaryColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
