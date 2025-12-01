//
//  DSColors.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

enum DSColors {

    // MARK: - Primary (fundo)
    static let primaryColor: UIColor = {
        return UIColor { trait in
            switch trait.userInterfaceStyle {
            case .dark:
                // Dourado intenso
                return UIColor(red: 242/255, green: 201/255, blue: 76/255, alpha: 1)

            default:
                // Fundo claro
                return UIColor(red: 245/255, green: 247/255, blue: 250/255, alpha: 1)
            }
        }
    }()

    // MARK: - Secondary (botões e bordas)
    static let secondaryColor: UIColor = {
        return UIColor { trait in
            switch trait.userInterfaceStyle {
            case .dark:
                // Preto profundo
                return UIColor(red: 10/255, green: 10/255, blue: 10/255, alpha: 1)

            default:
                // Cinza azulado (melhor que o verde)
                return UIColor(red: 60/255, green: 65/255, blue: 85/255, alpha: 1)
            }
        }
    }()

    // MARK: - Textos
    static let titleTextColor: UIColor = {
        return UIColor { trait in
            return trait.userInterfaceStyle == .dark
            ? UIColor.black        // TEXTO PRETO NO DARK MODE
            : UIColor.black        // Texto preto no light também
        }
    }()

    static let subtitleTextColor: UIColor = {
        return UIColor { trait in
            return trait.userInterfaceStyle == .dark
            ? UIColor(white: 0.1, alpha: 1)   // quase preto
            : UIColor.darkGray
        }
    }()
}

final class ThemeManager {
    
    enum Theme: String {
        case light, dark
    }
    
    static let shared = ThemeManager()
    
    private let key = "selectedTheme"
    
    var currentTheme: Theme {
        if let saved = UserDefaults.standard.string(forKey: key),
           let theme = Theme(rawValue: saved) {
            return theme
        }
        return .dark
    }
    
    func applyTheme(to window: UIWindow?) {
        window?.overrideUserInterfaceStyle = currentTheme == .dark ? .dark : .light
    }
    
    func setTheme(_ theme: Theme) {
        UserDefaults.standard.setValue(theme.rawValue, forKey: key)
        // Aplica imediatamente no app
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = scene.windows.first {
            window.overrideUserInterfaceStyle = theme == .dark ? .dark : .light
        }
    }
}
