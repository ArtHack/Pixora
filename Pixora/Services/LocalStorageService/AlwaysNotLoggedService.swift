//
//  AlwaysNotLoggedService.swift
//  Pixora
//
//  Created by Artem Khakimullin on 07.02.2026.
//

import Foundation

struct AlwaysNotLoggedService: LocalStorageServiceProtocol {
    func getUserToken() -> String? {
        nil
    }
}
