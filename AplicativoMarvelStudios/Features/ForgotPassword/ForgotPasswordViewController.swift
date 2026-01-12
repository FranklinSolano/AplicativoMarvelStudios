import UIKit

protocol ForgotPasswordViewControllerDisplay: AnyObject {
    
}

final class ForgotPasswordViewController: UIViewController {
    
    typealias Dependencies = HasDesignSystemComponentsInterface
    private let dependencies: Dependencies
    private let screen: ForgotPasswordScreen
    private let interactor: ForgotPasswordInteracting
    
    init(interactor: ForgotPasswordInteracting, dependencies: Dependencies = DependencyContainer()) {
        self.interactor = interactor
        self.dependencies = dependencies
        self.screen = ForgotPasswordScreen(dependencies: dependencies)
        super.init(nibName: nil, bundle: nil)
        screen.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = screen
    }
}

extension ForgotPasswordViewController: ForgotPasswordViewControllerDisplay {
    
}

extension ForgotPasswordViewController: ForgotPasswordScreenProtocol {
    func actionBackButton() {
        interactor.navigationBackButtonInteractor()
    }
    
    func actionEnterButton() {
    }
}
