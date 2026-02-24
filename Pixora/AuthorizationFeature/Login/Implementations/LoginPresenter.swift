//
//  LoginPresenter.swift
//  Pixora
//
//  Created by Artem Khakimullin on 17.02.2026.
//

final class LoginPresenter: LoginPresenterProtocol {
    private let view: LoginViewController
    
    init(view: LoginViewController) {
        self.view = view
    }
    
    func setLoginEnabled(isEnabled: Bool) {
        view.setLoginEnabled(isEnabled: isEnabled)
    }
    
    func setIsLoading(isLoading: Bool) {
        view.setIsLoading(isLoading: isLoading)
    }
    
    func showError(message: String) {
        view.showErrorText(errorText: message)
    }
    
    func hideErrorText() {
        view.hideErrorText()
    }
}
