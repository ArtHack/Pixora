//
//  LoginInteractor.swift
//  Pixora
//
//  Created by Artem Khakimullin on 17.02.2026.
//

import Foundation

class LoginInteractor: LoginInteractorProtocol {
    private let presenter: LoginPresenterProtocol
    private let localStorage: LocalStorageServiceProtocol
    private let networkService: NetworkServiceProtocol
    
    private var login: String = ""
    private var password: String = ""
    
    init(
        presenter: LoginPresenterProtocol,
        localStorage: LocalStorageServiceProtocol,
        networkService: NetworkServiceProtocol
    ) {
        self.presenter = presenter
        self.localStorage = localStorage
        self.networkService = networkService
    }
    
    func updateLogin(_ login: String) {
        self.login = login
        self.presenter.setLoginEnabled(isEnabled: validateInput())
    }
    
    func updatePassword(_ password: String) {
        self.password = password
        self.presenter.setLoginEnabled(isEnabled: validateInput())
    }

    func loginUser() {
        presenter.hideErrorText()
        presenter.setIsLoading(isLoading: true)
        
        networkService.loginUser(login: login, password: password) { [weak self] response in
            guard let self else { return }
            
            defer { self.presenter.setIsLoading(isLoading: false)}
            
            switch response {
                
            case .success(let token):
                _ = localStorage.setUserToken(newToken: token.token)
                self.presenter.hideErrorText()
                self.presenter.successLogin()
                
            case .failure(let error):
                self.presenter.showError(message: error.localizedDescription)
            }
        }
    }
    
    private func validateInput() -> Bool {
        !self.login.isEmpty && !self.password.isEmpty
    }
}
