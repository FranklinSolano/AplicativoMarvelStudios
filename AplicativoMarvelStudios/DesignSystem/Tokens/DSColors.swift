//
//  DSColors.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin Stilhano Solano on 28/05/25.
//

import UIKit

enum DSColors {
    
    // Fundo principal da tela (muda com o tema)
    static let primaryColor: UIColor = {
        return UIColor { trait in
            switch trait.userInterfaceStyle {
            case .dark:
                // Fundo amarelo no Dark Mode
                return UIColor(red: 242/255, green: 201/255, blue: 76/255, alpha: 1)
            default:
                // Fundo vermelho no Light Mode
                return UIColor(red: 199/255, green: 52/255, blue: 58/255, alpha: 1)
            }
        }
    }()

    // Secondary: botões, search, bordas - SEMPRE PRETO (cor fixa)
    static let secondaryColor: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)

    // Textos e ícones sempre brancos (cor fixa)
    static let textWhiteColor: UIColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)

    // Títulos e subtítulos (preto sobre fundo colorido) - cor fixa
    static let titleTextColor: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    
    static let subtitleTextColor: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
}
