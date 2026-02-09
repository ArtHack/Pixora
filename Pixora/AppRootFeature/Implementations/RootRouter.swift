//
//  RootRouter.swift
//  Pixora
//
//  Created by Artem Khakimullin on 07.02.2026.
//

import UIKit
import Swinject

class RootRouter: AppRootRouter {

    private let resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func navigateToLogin(parent: UINavigationController) {
        parent.pushViewController(LoginViewController(), animated: true)
    }
    
    func navigateToAuthorized(parent: UINavigationController) {
        parent.pushViewController(MainViewController(), animated: true)
    }
}
