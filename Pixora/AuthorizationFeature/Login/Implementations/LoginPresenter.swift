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
}
