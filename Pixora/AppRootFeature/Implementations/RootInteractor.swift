//
//  RootInteractor.swift
//  Pixora
//
//  Created by Artem Khakimullin on 07.02.2026.
//

import Foundation

class RootInteractor: AppRootInteractorProtocol {
    
    private let presenter: AppRootPresenterProtocol
    private let localService: LocalStorageServiceProtocol
    
    init(presenter: AppRootPresenterProtocol, localService: LocalStorageServiceProtocol) {
        self.presenter = presenter
        self.localService = localService
    }
    
    func checkLoginStatus() {
        presenter.isUserLogged(isLogged: localService.getUserToken() != nil)
    }
}
