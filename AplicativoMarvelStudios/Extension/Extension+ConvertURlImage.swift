//
//  Extension+ConvertURlImage.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 06/06/25.
//

import UIKit
import SDWebImage

extension UIImageView {
    func loadImage(from urlString: String?) {
        guard let urlString = urlString, let url = URL(string: urlString) else { return }
        self.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"))
    }
}
