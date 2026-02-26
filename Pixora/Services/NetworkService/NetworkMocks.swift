//
//  NetworkMocks.swift
//  Pixora
//
//  Created by Artem Khakimullin on 23.02.2026.
//

import Foundation

struct AlwaysLoginMock: NetworkServiceProtocol {
    func registerUser(
        login: String,
        password: String,
        completion: @escaping (Result<AuthResponse, any Error>) -> Void
    ) {
        let response = AuthResponse(token: "", refreshToken: "")
        DispatchQueue.global().asyncAfter(deadline: .now() + 3.3) {
            completion(.success(response))
        }
    }
    
    func loginUser(
        login: String,
        password: String,
        completion: @escaping (Result<AuthResponse, Error>) -> Void
    ) {
        let response = AuthResponse(token: "", refreshToken: "")
        DispatchQueue.global().asyncAfter(deadline: .now() + 3.3) {
            completion(.success(response))
        }
    }
}

struct AlwaysFailLoginMock: NetworkServiceProtocol {
    func registerUser(
        login: String,
        password: String,
        completion: @escaping (Result<AuthResponse, any Error>) -> Void
    ) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3.3) {
            completion(.failure(AuthMockError.registerError))
        }
    }
    
    func loginUser(
        login: String,
        password: String,
        completion: @escaping (Result<AuthResponse, Error>) -> Void
    ) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3.3) {
            completion(.failure(AuthMockError.loginError))
        }
    }
}
