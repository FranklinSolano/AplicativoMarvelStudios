import Foundation

protocol ForgotPasswordPresenting {
    func navigationBackButtonPresenter()
}

final class ForgotPasswordPresenter {
    
    weak var view: ForgotPasswordViewControllerDisplay?
    let coordinator: ForgotPasswordCoordinating
    
    init(view: ForgotPasswordViewControllerDisplay? = nil, coordinator: ForgotPasswordCoordinating) {
        self.view = view
        self.coordinator = coordinator
    }
}

extension ForgotPasswordPresenter: ForgotPasswordPresenting {
    func navigationBackButtonPresenter() {
        coordinator.navigationBackButtonCoordinator()
    }
}
