//
//  AuthorizationConfigurator.swift
//  Pixora
//
//  Created by Artem Khakimullin on 18.02.2026.
//

import Foundation
import Swinject

final class AuthorizationConfigurator {
    private let resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func configure(view: LoginViewController) throws {
        guard let presenter = resolver.resolve(LoginPresenterProtocol.self, argument: view),
              let interactor = resolver.resolve(LoginInteractorProtocol.self, argument: presenter),
              let router = resolver.resolve(AuthRouterProtocol.self)
        else { throw DIErrors.unableToResolve }
        
        
        view.interactor = interactor
        view.router = router
    }
    
    func configure(view: RegisterViewController) throws {
        guard let router = resolver.resolve(AuthRouterProtocol.self)
        else { throw DIErrors.unableToResolve }
        
        
        view.router = router
    }
}
