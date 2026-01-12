import UIKit

protocol ForgotPasswordCoordinating {
    func navigationBackButtonCoordinator()
}

final class ForgotPasswordCoordinator {
    var navigation: UINavigationController?
    var presenter: ForgotPasswordPresenter?
}

extension ForgotPasswordCoordinator: ForgotPasswordCoordinating {
    func navigationBackButtonCoordinator() {
        guard let navigation else { return}
        navigation.popViewController(animated: true)
    }
}
