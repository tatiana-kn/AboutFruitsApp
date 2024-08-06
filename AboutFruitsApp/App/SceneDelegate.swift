//
//  SceneDelegate.swift
//  AboutFruitsApp
//
//  Created by Tia M on 2/1/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow.init(windowScene: windowScene)
        window?.rootViewController = MainConfigurator().configure()
        window?.makeKeyAndVisible()
    }
}

