//
//  AppRootViewController.swift
//  Pixora
//
//  Created by Artem Khakimullin on 07.02.2026.
//

import UIKit

class AppRootViewController: UIViewController {
    
    var interactor: AppRootInteractor?
    var router: AppRootRouter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        interactor?.checkLoginStatus()
    }
    
    func isUserLogged(isLogged: Bool) {
        if isLogged {
            router?.navigateToAuthorized(parent: self.navigationController!)
        } else {
            router?.navigateToLogin(parent: self.navigationController!)
        }
    }
}
