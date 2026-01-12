import UIKit

final class ForgotPasswordFactory: UIViewController {
    func make(navigationController: UINavigationController?) -> ForgotPasswordViewController {
        let coordinator = ForgotPasswordCoordinator()
        coordinator.navigation = navigationController
        
        let presenter = ForgotPasswordPresenter(coordinator: coordinator)
        
        let dependencies = DependencyContainer()
        
        let interactor = ForgotPasswordInteractor(presenter: presenter, dependenciesService: dependencies)
        
        let forgotPasswordVC = ForgotPasswordViewController(interactor: interactor, dependencies: dependencies)
        
        presenter.view = forgotPasswordVC
        coordinator.presenter = presenter
        
        return forgotPasswordVC
    }
}
