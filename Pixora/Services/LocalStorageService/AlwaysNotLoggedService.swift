//
//  AlwaysNotLoggedService.swift
//  Pixora
//
//  Created by Artem Khakimullin on 07.02.2026.
//

import Foundation

struct AlwaysNotLoggedService: LocalStorageService {
    func getUserToken() -> String? {
        nil
    }
}
