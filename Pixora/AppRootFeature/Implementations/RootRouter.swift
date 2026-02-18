//
//  RootRouter.swift
//  Pixora
//
//  Created by Artem Khakimullin on 07.02.2026.
//

import UIKit
import Swinject

class RootRouter: AppRootRouterProtocol {

    private let resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func navigateToLogin(parent: UINavigationController) throws {
        guard let authConfigurator = resolver.resolve(AuthorizationConfigurator.self)
        else { throw DIErrors.unableToResolve }
        
        let controller = LoginViewController()
        try authConfigurator.configure(view: controller)
        
        parent.pushViewController(controller, animated: true)
    }
    
    func navigateToAuthorized(parent: UINavigationController) throws {
        parent.pushViewController(MainViewController(), animated: true)
    }
}
