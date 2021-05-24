//
//  AuthorizationCoordinator.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 14.03.2021.
//

import UIKit

class AuthorizationCoordinator: Coordinator {
	var navigationController: UINavigationController
	var authorizationIsFinished: (() -> Void)?

	init(navigationController: UINavigationController = UINavigationController()) {
		self.navigationController = navigationController
        navigationController.navigationBar.prefersLargeTitles = true
	}

	func signInViewController() -> UIViewController {
		let viewController = AuthorizationFactory.makeSignInViewController(from: self)
		navigationController.viewControllers = [viewController]
		return navigationController
	}

	func signUpViewController() {
		let viewController = AuthorizationFactory.makeSignUpViewController(from: self)
		navigationController.pushViewController(viewController, animated: true)
	}
}
