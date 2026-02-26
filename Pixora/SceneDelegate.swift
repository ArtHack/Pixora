//
//  SceneDelegate.swift
//  Pixora
//
//  Created by Artem Khakimullin on 03.02.2026.
//

import Swinject
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    private static let assembler = Assembler([
        ServicesAssembly(),
        AuthAssembly(),
        MainAssembly(),
        RootAssembly()
    ])

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
      
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let rootController: UIViewController
        
        if let configurator = SceneDelegate.assembler.resolver.resolve(AppRootConfigurator.self) {
            let appController = AppRootViewController()
            do {
                try configurator.configure(view: appController)
                rootController = appController
            } catch {
                rootController = CrashErrorController()
            }
        } else {
            rootController = CrashErrorController()
        }
              
        let navigationController =  UINavigationController(rootViewController: rootController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
