//
//  ButtonProtocols.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 22/07/25.
//

import UIKit

// MARK: - Buttoning

protocol Buttoning: UIView {
    func setDTO(_ dto: ButtonDTO)
    func onClick(_ action: @escaping () -> Void)
}

// MARK: - ButtonImageing

protocol ButtonImageing: UIView {
    func setDTO(_ dto: ImageButtonDTO)
    func onClick(_ action: @escaping () -> Void)
}
