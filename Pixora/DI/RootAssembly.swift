//
//  RootAssembly.swift
//  Pixora
//
//  Created by Artem Khakimullin on 07.02.2026.
//

import Foundation
import Swinject

class RootAssembly: Assembly {
    
    func assemble(container: Swinject.Container) {
        container.register(AppRootPresenterProtocol.self) { _, controller in
                RootPresenter(view: controller)
        }
        
        container.register(AppRootInteractorProtocol.self) { resolver, presenter in
            RootInteractor(
                presenter: presenter ,
                localService: resolver.resolve(LocalStorageServiceProtocol.self, name: "always_not_logged")!
            )
        }
        
        container.register(AppRootRouterProtocol.self) { resolver in
            RootRouter(resolver: resolver)
        }
        
        container.register(AppRootConfigurator.self) { resolver in
            AppRootConfigurator(resolver: resolver)
        }
    }
}
