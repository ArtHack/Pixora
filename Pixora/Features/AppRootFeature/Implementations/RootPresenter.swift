//
//  RootPresenter.swift
//  Pixora
//
//  Created by Artem Khakimullin on 07.02.2026.
//

import Foundation

class RootPresenter: AppRootPresenterProtocol {
    
    private let view: AppRootViewController
    
    init(view: AppRootViewController) {
        self.view = view
    }
    
    func isUserLogged(isLogged: Bool) {
        view.isUserLogged(isLogged: isLogged)
    }
}
