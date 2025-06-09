//
//  Extension+ConvertURlImage.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//
import UIKit

import SDWebImage

extension UIImageView {
    func loadImage(from url: String?) {
        guard let urlString = url, let imageURL = URL(string: urlString) else { return }
        self.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholder"))
    }
}
