//
//  RegisterInteractor.swift
//  Pixora
//
//  Created by Artem Khakimullin on 25.02.2026.
//

import Foundation

class RegisterInteractor: RegisterInteractorProtocol {
    private let presenter: RegisterPresenterProtocol
    private let localStorage: LocalStorageServiceProtocol
    private let networkService: NetworkServiceProtocol
    
    private var login: String = ""
    private var password: String = ""
    
    init(
        presenter: RegisterPresenterProtocol,
        localStorage: LocalStorageServiceProtocol,
        networkService: NetworkServiceProtocol
    ) {
        self.presenter = presenter
        self.localStorage = localStorage
        self.networkService = networkService
    }
    
    func updateLogin(_ login: String) {
        self.login = login
        self.presenter.setRegisterEnabled(isEnabled: validateInput())
    }
    
    func updatePassword(_ password: String) {
        self.password = password
        self.presenter.setRegisterEnabled(isEnabled: validateInput())
    }

    func registerUser() {
        presenter.hideErrorText()
        presenter.setIsRegister(isLoading: true)
        
        networkService.registerUser(login: login, password: password) { [weak self] response in
            guard let self else { return }
            
            defer { self.presenter.setIsRegister(isLoading: false)}
            
            switch response {
                
            case .success(let token):
                self.presenter.hideErrorText()
                self.presenter.successRegistration()
                
            case .failure(let error):
                self.presenter.showError(message: error.localizedDescription)
            }
        }
    }
    
    private func validateInput() -> Bool {
        !self.login.isEmpty && !self.password.isEmpty
    }
}
