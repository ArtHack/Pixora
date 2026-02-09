//
//  AppRootRouter.swift
//  Pixora
//
//  Created by Artem Khakimullin on 07.02.2026.
//

import UIKit

protocol AppRootRouter {
    func navigateToLogin(parent: UINavigationController)
    func navigateToAuthorized(parent: UINavigationController)
}

