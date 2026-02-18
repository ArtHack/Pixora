//
//  AppRootRouter.swift
//  Pixora
//
//  Created by Artem Khakimullin on 07.02.2026.
//

import UIKit

protocol AppRootRouterProtocol {
    func navigateToLogin(parent: UINavigationController) throws
    func navigateToAuthorized(parent: UINavigationController) throws
}

