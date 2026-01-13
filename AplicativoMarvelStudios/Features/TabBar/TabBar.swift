//
//  TabbarViewController.swift
//  AplicativoMarvelStudios
//
//  TabBar com fundo preto e ícones brancos em AMBOS os temas
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Atualiza as cores sempre que a view aparecer
        // Isso garante que após trocar o tema, as cores atualizem
        updateColors()
    }
    
    private func updateColors() {
        // Força as views filhas a atualizar suas cores
        viewControllers?.forEach { viewController in
            viewController.view.backgroundColor = DSColors.primaryColor
        }
    }
    
    // MARK: - Setup
    
    private func setupTabbarController() {
        // Criar os NavigationControllers PRIMEIRO
        let homeNav = UINavigationController()
        let favoritosNav = UINavigationController()
        let profileNav = UINavigationController()
        
        // Ocultar as barras de navegação
        homeNav.setNavigationBarHidden(true, animated: false)
        favoritosNav.setNavigationBarHidden(true, animated: false)
        profileNav.setNavigationBarHidden(true, animated: false)
        
        // Criar os view controllers passando os NavigationControllers corretos
        let homeVC = homeFactory.make(navigationController: homeNav)
        let favoritesVC = favoritesFactory.make(navigationController: favoritosNav)
        let profileVC = profileFactory.make(navigationController: profileNav)
        
        // Setar os view controllers como root dos NavigationControllers
        homeNav.viewControllers = [homeVC]
        favoritosNav.viewControllers = [favoritesVC]
        profileNav.viewControllers = [profileVC]
        
        setViewControllers([homeNav, favoritosNav, profileNav], animated: false)
        
        configureTabBarAppearance()
        configureTabBarItems()
    }
    
    private func configureTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        // COR FIXA - PRETO PURO
        let blackColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        // COR FIXA - BRANCO PURO
        let whiteColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        appearance.backgroundColor = blackColor
        
        // Ícones normais - brancos
        appearance.stackedLayoutAppearance.normal.iconColor = whiteColor
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: whiteColor]
        
        // Ícones selecionados - brancos
        appearance.stackedLayoutAppearance.selected.iconColor = whiteColor
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: whiteColor]
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        
        tabBar.backgroundColor = blackColor
        tabBar.barTintColor = blackColor
        tabBar.tintColor = whiteColor
        tabBar.unselectedItemTintColor = whiteColor
        tabBar.isTranslucent = false
    }
    
    private func configureTabBarItems() {
        guard let items = tabBar.items else { return }
        
        // Home Tab
        items[0].title = "Home"
        items[0].image = UIImage(systemName: "house")?
            .withRenderingMode(.alwaysTemplate)
        items[0].selectedImage = UIImage(systemName: "house.fill")?
            .withRenderingMode(.alwaysTemplate)
        
        // Favorites Tab
        items[1].title = "Favorites"
        items[1].image = UIImage(systemName: "heart")?
            .withRenderingMode(.alwaysTemplate)
        items[1].selectedImage = UIImage(systemName: "heart.fill")?
            .withRenderingMode(.alwaysTemplate)
        
        // Profile Tab
        items[2].title = "Profile"
        items[2].image = UIImage(systemName: "person.circle")?
            .withRenderingMode(.alwaysTemplate)
        items[2].selectedImage = UIImage(systemName: "person.circle.fill")?
            .withRenderingMode(.alwaysTemplate)
    }
}
