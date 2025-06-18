//
//  Extension+AlertViewController.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 02/06/25.
//

import UIKit

extension UIViewController {
    func getAlertController(title: String, message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel) { _ in
            completion?()
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
}
