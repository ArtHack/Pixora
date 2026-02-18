//
//  AppRootConfigurator.swift
//  Pixora
//
//  Created by Artem Khakimullin on 07.02.2026.
//

import Foundation
import Swinject

struct AppRootConfigurator {
    
    private let resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func configure(view: AppRootViewController) throws {
        guard let presenter = resolver.resolve(AppRootPresenterProtocol.self, argument: view),
              let interactor = resolver.resolve(AppRootInteractorProtocol.self, argument: presenter),
              let router = resolver.resolve(AppRootRouterProtocol.self)
        else { throw DIErrors.unableToResolve }
        
        view.interactor = interactor
        view.router = router
    }
}
