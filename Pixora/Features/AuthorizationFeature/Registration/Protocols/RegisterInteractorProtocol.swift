//
//  RegisterInteractorProtocol.swift
//  Pixora
//
//  Created by Artem Khakimullin on 25.02.2026.
//

import Foundation

protocol RegisterInteractorProtocol {
    func updateLogin(_ login: String)
    func updatePassword(_ password: String)
    func registerUser()
}
