//
//  AuthResponse.swift
//  Pixora
//
//  Created by Artem Khakimullin on 23.02.2026.
//

import Foundation

struct AuthResponse: Decodable {
    let token: String
    let refreshToken: String
}
