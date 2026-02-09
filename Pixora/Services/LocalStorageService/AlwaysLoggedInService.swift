//
//  AlwaysLoggedInService.swift
//  Pixora
//
//  Created by Artem Khakimullin on 08.02.2026.
//

import Foundation

struct AlwaysLoggedInService: LocalStorageService {
    func getUserToken() -> String? {
        "loged"
    }
}
