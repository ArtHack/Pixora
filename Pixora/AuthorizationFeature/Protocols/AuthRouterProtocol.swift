//
//  AuthRouter.swift
//  Pixora
//
//  Created by Artem Khakimullin on 18.02.2026.
//

import UIKit

protocol AuthRouterProtocol {
    func goToRegister(parent: UINavigationController) throws
    func backToLogin(parent: UINavigationController)
}


