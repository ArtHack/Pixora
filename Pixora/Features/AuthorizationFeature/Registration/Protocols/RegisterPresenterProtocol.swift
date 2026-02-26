//
//  RegisterPresenterProtocol.swift
//  Pixora
//
//  Created by Artem Khakimullin on 25.02.2026.
//

import Foundation

protocol RegisterPresenterProtocol {
    func setRegisterEnabled(isEnabled: Bool)
    func setIsRegister(isLoading: Bool)
    func successRegistration()
    func showError(message: String)
    func hideErrorText()
}
