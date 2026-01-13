//
//  TabbarViewController.swift
//  AplicativoMarvelStudios
//
//  TabBar com fundo preto e ícones/títulos sempre brancos
//

import UIKit

class TabbarViewController: UITabBarController {
    
    private let homeFactory: HomeFactory
    private let favoritesFactory: FavoritesFactory
    private let profileFactory: ProfileFactory
     
    init(homeFactory: HomeFactory,
         favoritesFactory: FavoritesFactory,
         profileFactory: ProfileFactory) {
        self.homeFactory = homeFactory
        self.favoritesFactory = favoritesFactory
        self.profileFactory = profileFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) não implementado")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbarController()
    }
    
    // MARK: - Setup
    
    private func setupTabbarController() {
        // Criar NavigationControllers e esconder as barras de navegação
        let homeNav = UINavigationController()
        homeNav.setNavigationBarHidden(true, animated: false)
        let favoritosNav = UINavigationController()
        favoritosNav.setNavigationBarHidden(true, animated: false)
        let profileNav = UINavigationController()
        profileNav.setNavigationBarHidden(true, animated: false)
        
        // Criar ViewControllers via factories
        let homeVC = homeFactory.make(navigationController: homeNav)
        let favoritesVC = favoritesFactory.make(navigationController: favoritosNav)
        let profileVC = profileFactory.make(navigationController: profileNav)
        
        // Setar os roots
        homeNav.viewControllers = [homeVC]
        favoritosNav.viewControllers = [favoritesVC]
        profileNav.viewControllers = [profileVC]
        
        setViewControllers([homeNav, favoritosNav, profileNav], animated: false)
        
        configureTabBarAppearance()
        configureTabBarItems()
    }
    private func configureTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.shadowImage = nil
        appearance.shadowColor = nil

        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black

        // Ícones e títulos normais
        appearance.stackedLayoutAppearance.normal.iconColor = .white
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]

        // Ícones e títulos selecionados
        appearance.stackedLayoutAppearance.selected.iconColor = .white
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]

        // Aplica a mesma aparência em todas as situações
        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }

        tabBar.isTranslucent = false
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .white

        tabBar.overrideUserInterfaceStyle = .dark
        view.backgroundColor = .black

        // ← ESSAS DUAS LINHAS REMOVEM A BORDA DE VEZ
        tabBar.backgroundImage = UIImage() // remove qualquer imagem de fundo
        tabBar.shadowImage = UIImage()     // remove a linha separadora/sombra
    }
    
    private func configureTabBarItems() {
        guard let items = tabBar.items else { return }
        
        items[0].title = "Home"
        items[0].image = UIImage(systemName: "house")?.withRenderingMode(.alwaysTemplate)
        items[0].selectedImage = UIImage(systemName: "house.fill")?.withRenderingMode(.alwaysTemplate)
        
        items[1].title = "Favorites"
        items[1].image = UIImage(systemName: "heart")?.withRenderingMode(.alwaysTemplate)
        items[1].selectedImage = UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysTemplate)
        
        items[2].title = "Profile"
        items[2].image = UIImage(systemName: "person.circle")?.withRenderingMode(.alwaysTemplate)
        items[2].selectedImage = UIImage(systemName: "person.circle.fill")?.withRenderingMode(.alwaysTemplate)
    }
}
