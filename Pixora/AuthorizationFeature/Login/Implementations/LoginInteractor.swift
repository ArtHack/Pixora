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
    
    private var login: String = ""
    private var password: String = ""
    
    init(presenter: LoginPresenterProtocol, localStorage: LocalStorageServiceProtocol) {
        self.presenter = presenter
        self.localStorage = localStorage
    }
    
    func updateLogin(_ login: String) {
        self.login = login
        self.presenter.setLoginEnabled(isEnabled: validateInput())
    }
    
    func updatePassword(_ password: String) {
        self.password = password
        self.presenter.setLoginEnabled(isEnabled: validateInput())
    }
    
    private func validateInput() -> Bool {
        !self.login.isEmpty && !self.password.isEmpty
    }
}
