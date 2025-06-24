//
//  DSColors.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit

enum DSColors {
    
    static let primaryColor: UIColor = {
        return UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark
            ? UIColor(red: 20/255, green: 20/255, blue: 20/255, alpha: 1)  // Dark mode
            : UIColor.white  // Light mode
        }
    }()
    
    static let secondaryColor: UIColor = {
        return UIColor { trait in
            switch trait.userInterfaceStyle {
            case .dark:
                // Tema escuro: vermelho escuro que você já usava
                return UIColor(red: 47/255, green: 28/255, blue: 26/255, alpha: 1)
            default:
                // Tema claro: azul moderno que combina com fundo branco
                return UIColor(red: 38/255, green: 104/255, blue: 115/255, alpha: 1) // #3A69D7
            }
        }
    }()
    
    static let titleTextColor: UIColor = {
        return UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark
            ? .white
            : .black
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
