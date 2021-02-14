//
//  SceneDelegate.swift
//  RentateamTest
//
//  Created by Антон on 13.02.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow()
        window?.windowScene = windowScene
        let view = ListViewController()
        let collectionHandler = ListCollectionHandler()
        let presenter = ListPresenter(view: view, collectionHandler: collectionHandler)
        view.presenter = presenter
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}
