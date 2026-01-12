import Foundation

protocol ForgotPasswordInteracting {
    func navigationBackButtonInteractor()
}

final class ForgotPasswordInteractor {
    
    let presenter: ForgotPasswordPresenting
    private let dependenciesService: HasHttpServicesInterface
    
    init(presenter: ForgotPasswordPresenting, dependenciesService: HasHttpServicesInterface) {
        self.presenter = presenter
        self.dependenciesService = dependenciesService
    }
}

extension ForgotPasswordInteractor: ForgotPasswordInteracting {
    func navigationBackButtonInteractor() {
        presenter.navigationBackButtonPresenter()
    }
}
