//
//  SettingsViewController.swift
//  AplicativoMarvelStudios
//
//  Created by Franklin  Stilhano Solano on 28/05/25.
//

import UIKit
import SnapKit
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    lazy var exitButton: UIButton = {
        let button = DSButtonTitles(title: "Exit", font: DSFonts.titleBold22)
        button.addTarget(self, action: #selector(tappedExitButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func logoutAndShowLogin() {
        do {
            try Auth.auth().signOut()
            print("Usuário deslogado")

            if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
               let window = sceneDelegate.window {
                
                // Chama a função que cria todo o fluxo de login
                let loginNav = sceneDelegate.startLoginFlow()
                window.rootViewController = loginNav

                UIView.transition(with: window,
                                  duration: 0.5,
                                  options: [.transitionFlipFromLeft],
                                  animations: nil,
                                  completion: nil)
            }
        } catch {
            print("Erro ao deslogar: \(error.localizedDescription)")
        }
    }
    
    @objc private func tappedExitButton() {
        logoutAndShowLogin()
    }
    func voltarParaLogin() {
        navigationController?.popToRootViewController(animated: true)
    }
}

extension ProfileViewController: ViewCodeProtocol {
    func setupElements() {
        view.addSubview(exitButton)
    }
    
    func setupConstraints() {
        exitButton.snp.makeConstraints { make in
            make.centerX.centerY.edges.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = DSColors.primaryColor
    }
    

}

        
