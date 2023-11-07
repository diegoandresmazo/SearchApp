//
//  SceneDelegate.swift
//  SearchApp
//
//  Created by Diego Mazo on 4/11/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	let apiService = APIService()
	let rootNavigationController = UINavigationController()
	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = scene as? UIWindowScene else { return }
		
		window = UIWindow(frame: windowScene.coordinateSpace.bounds)
		window?.windowScene = windowScene
		
		let navigator = Navigator(
			window: window!,
			rootNavigationController: rootNavigationController,
			apiService: apiService
		)
		
		navigator.start()
	}
	
	func sceneDidDisconnect(_ scene: UIScene) {}

	func sceneDidBecomeActive(_ scene: UIScene) {}

	func sceneWillResignActive(_ scene: UIScene) {}

	func sceneWillEnterForeground(_ scene: UIScene) {}

	func sceneDidEnterBackground(_ scene: UIScene) {}
}
