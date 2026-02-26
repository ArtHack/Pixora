//
//  AppRootViewController.swift
//  Pixora
//
//  Created by Artem Khakimullin on 07.02.2026.
//

import UIKit

class AppRootViewController: BaseController {
    
    var interactor: AppRootInteractorProtocol?
    var router: AppRootRouterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor?.checkLoginStatus()
    }
    
    func isUserLogged(isLogged: Bool) {
        
        guard let navParent = self.navigationController else { return }
        
        do {
            if isLogged {
                try router?.navigateToAuthorized(parent: navParent)
            } else {
                try router?.navigateToLogin(parent: navParent)
            }
        } catch _ as DIErrors {
            showDIError()
        } catch {
            showErrorAlert(title: "Unknown error")
        }
    }
}
