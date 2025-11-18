//
//  DSImageView.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 09/06/25.
//

import UIKit
import SDWebImage

//MARK: - ImageViewing

protocol ImageViewing: UIView {
    var image: UIImage? { get set }
    func setImage(from urlString: String?)
}

//MARK: - DSImageView

class DSImageView: UIImageView {
    override init(image: UIImage?) {
        super.init(image: image ?? UIImage(named: "placeholder"))
        setupImage()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupImage() {
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

//MARK: - DSImageViewAdapter

final class DSImageViewAdapter: DSImageView, ImageViewing {
    func setImage(from urlString: String?) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            self.image = UIImage(named: "placeholder")
            return
        }
        self.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"))
    }
}

