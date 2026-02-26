//
//  MainAssembly.swift
//  Pixora
//
//  Created by Artem Khakimullin on 26.02.2026.
//

import Swinject
import Foundation

class MainAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(MainFeatureConfigurator.self) { resolver in
                MainFeatureConfigurator(resolver: resolver)
        }
    }
}
