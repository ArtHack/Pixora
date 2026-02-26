//
//  NetworkService.swift
//  Pixora
//
//  Created by Artem Khakimullin on 23.02.2026.
//

import Foundation

protocol NetworkServiceProtocol {
    func loginUser(login: String, password: String, completion: @escaping (Result<AuthResponse, Error>) -> Void)
    func registerUser(login: String, password: String, completion: @escaping (Result<AuthResponse, Error>) -> Void)
}
