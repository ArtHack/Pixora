//
//  AuthRouter.swift
//  Pixora
//
//  Created by Artem Khakimullin on 18.02.2026.
//

import UIKit
import Swinject

final class AuthRouter: AuthRouterProtocol {
    
    private let resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func goToRegister(parent: UINavigationController) throws {
        guard let configurator = resolver.resolve(AuthorizationConfigurator.self)
        else { throw DIErrors.unableToResolve }
        
        let controller = RegisterViewController()
        try configurator.configure(view: controller)
        
        parent.pushViewController(controller, animated: true)
    }
    
    func backToLogin(parent: UINavigationController) {
        parent.popViewController(animated: true)
    }
}
