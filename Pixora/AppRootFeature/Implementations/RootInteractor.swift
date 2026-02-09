//
//  RootInteractor.swift
//  Pixora
//
//  Created by Artem Khakimullin on 07.02.2026.
//

import Foundation

class RootInteractor: AppRootInteractor {
    
    private let presenter: AppRootPresenter
    private let localService: LocalStorageService
    
    init(presenter: AppRootPresenter, localService: LocalStorageService) {
        self.presenter = presenter
        self.localService = localService
    }
    
    func checkLoginStatus() {
        presenter.isUserLogged(isLogged: localService.getUserToken() != nil)
    }
}
