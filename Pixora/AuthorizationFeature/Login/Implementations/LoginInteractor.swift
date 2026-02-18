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
    
    init(presenter: LoginPresenterProtocol, localStorage: LocalStorageServiceProtocol) {
        self.presenter = presenter
        self.localStorage = localStorage
    }
}
