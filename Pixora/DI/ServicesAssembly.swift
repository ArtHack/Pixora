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
        container.register(LocalStorageServiceProtocol.self, name: "always_not_logged") { resolver in
            AlwaysNotLoggedService()
        }
        
        container.register(LocalStorageServiceProtocol.self, name: "always_logged") { resolver in
            AlwaysLoggedInService()
        }
        
        container.register(NetworkServiceProtocol.self, name: "always_login") { resolver in
            AlwaysLoginMock()
        }
        
        container.register(NetworkServiceProtocol.self, name: "always_fail_login") { resolver in
            AlwaysFailLoginMock()
        }
    }
}
