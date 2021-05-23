//
//  RootCoordinator.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 21.03.2021.
//

import UIKit
import Network
import Reachability

class RootCoordinator {

	var window: UIWindow
    let authorizationService: AuthorizationService = RestAuthorizationService()

	init(window: UIWindow) {
		self.window = window
	}

	func start() {
        let reachability = try! Reachability()
        if reachability.connection == .unavailable {
            showTabBarFlow()
        }

        authorizationService.checkAuth { result in
            switch result {
            case .success( _):
                self.showTabBarFlow()
            case .failure( _):
                self.showAuthorizationFlow()
            }
        }
	}

	func showAuthorizationFlow() {
		let authorizationCoordinator = AuthorizationCoordinator()
		authorizationCoordinator.authorizationIsFinished = {
			self.showTabBarFlow()
		}
		window.rootViewController = authorizationCoordinator.signInViewController()
		window.makeKeyAndVisible()
	}

	func showTabBarFlow() {
		let tabBarController = MainTabBarController()
		window.rootViewController = tabBarController
		window.makeKeyAndVisible()
	}
}
