//
//  RegisterPresenter.swift
//  Pixora
//
//  Created by Artem Khakimullin on 25.02.2026.
//

final class RegisterPresenter: RegisterPresenterProtocol {
    private let view: RegisterViewController
    
    init(view: RegisterViewController) {
        self.view = view
    }
    
    func setRegisterEnabled(isEnabled: Bool) {
        view.setRegisterEnabled(isEnabled: isEnabled)
    }
    
    func setIsRegister(isLoading: Bool) {
        view.setIsLoading(isLoading: isLoading)
    }
    
    func successRegistration() {
        view.successRegister()
    }
    
    func showError(message: String) {
        view.showErrorText(errorText: message)
    }
    
    func hideErrorText() {
        view.hideErrorText()
    }
}
