//
//  RootCoordinator.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 21.03.2021.
//

import UIKit

class RootCoordinator {
	var window: UIWindow

	init(window: UIWindow) {
		self.window = window
	}

	func start() {
		if isAuth() {
			showTabBarFlow()
		} else {
			showAuthorizationFlow()
//			showTabBarFlow()
		}
	}

	func isAuth() -> Bool {
		UserDefaults.standard.bool(forKey: "authorized")
	}

	func showAuthorizationFlow() {
		let authorizationCoordinator = AuthorizationCoordinator()
		authorizationCoordinator.authorizationIsFinished = {
			self.showTabBarFlow()
		}
		#warning("todo")
//		let controller: SignInViewController = SignInViewController(presenter: SignInPresenter())
//		window.rootViewController = controller
		window.rootViewController = authorizationCoordinator.signInViewController()
		window.makeKeyAndVisible()
	}

	func showTabBarFlow() {
		let tabBarController = MainTabBarController()
		window.rootViewController = tabBarController
		window.makeKeyAndVisible()
	}
}
