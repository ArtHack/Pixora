//
//  ServicesAssembly.swift
//  Pixora
//
//  Created by Artem Khakimullin on 07.02.2026.
//

import Foundation
import Swinject

class ServicesAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(LocalStorageService.self, name: "always_not_logged") { resolvver in
            AlwaysNotLoggedService()
        }
        
        container.register(LocalStorageService.self, name: "always_logged") { resolvver in
            AlwaysLoggedInService()
        }
    }
}
