//
//  DS.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 16/07/25.
//

import UIKit

protocol LoadingIndicatable: AnyObject {
    var view: UIView { get }
    func startAnimating()
    func stopAnimating()
    var isHidden: Bool { get set }
}

final class DSActivityIndicatorAdapter: UIActivityIndicatorView, LoadingIndicatable {
    var view: UIView { return self }

    init() {
        super.init(style: .large)
        hidesWhenStopped = true
        color = DSColors.titleTextColor
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
