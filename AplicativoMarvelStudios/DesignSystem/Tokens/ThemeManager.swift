//
//  ThemeManager.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 12/01/26.

import UIKit

final class ThemeManager {
    
    // MARK: - Theme Types
    
    enum Theme: String {
        case light  // Tema Vermelho
        case dark   // Tema Amarelo
    }
    
    // MARK: - Singleton
    
    static let shared = ThemeManager()
    
    private init() {}
    
    // MARK: - Properties
    
    private let key = "selectedTheme"
    
    var currentTheme: Theme {
        if let saved = UserDefaults.standard.string(forKey: key),
           let theme = Theme(rawValue: saved) {
            return theme
        }
        return .dark // Tema padrão: Dark (Amarelo)
    }
    
    // MARK: - Public Methods
    
    /// Aplica o tema atual em uma window específica
    func applyTheme(to window: UIWindow?) {
        window?.overrideUserInterfaceStyle = currentTheme == .dark ? .dark : .light
    }
    
    /// Define e aplica um novo tema
    func setTheme(_ theme: Theme) {
        UserDefaults.standard.setValue(theme.rawValue, forKey: key)
        
        // Aplica imediatamente em todas as windows
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .forEach { window in
                window.overrideUserInterfaceStyle = theme == .dark ? .dark : .light
            }
    }
}
