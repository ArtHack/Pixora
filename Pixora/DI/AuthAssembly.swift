//
//  AuthAssembly.swift
//  Pixora
//
//  Created by Artem Khakimullin on 18.02.2026.
//

import Foundation
import Swinject

final class AuthAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(LoginPresenterProtocol.self) { _, controller in
                LoginPresenter(view: controller)
        }
        
        container.register(LoginInteractorProtocol.self) { resolver, presenter in
            LoginInteractor(
                presenter: presenter ,
                localStorage: resolver.resolve(LocalStorageServiceProtocol.self, name: "always_not_logged")!
            )
        }
        
        container.register(AuthRouterProtocol.self) { resolver in
            AuthRouter(resolver: resolver)
        }
        
        container.register(AuthorizationConfigurator.self) { resolver in
            AuthorizationConfigurator(resolver: resolver)
        }
    }
}
