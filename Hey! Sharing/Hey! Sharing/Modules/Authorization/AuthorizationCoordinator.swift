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

	init(navigationController: UINavigationController = UINavigationController()){
		self.navigationController = navigationController
	}

	func signInViewController() -> UIViewController {
		#warning("redo")
//		let controller: SignInViewController = SignInViewController(presenter: SignInPresenter())

		let presenter = SignInPresenter()
		presenter.moveToSignUp = {
			self.signUpViewController()
		}
		presenter.coordinator = self
		navigationController.viewControllers = [presenter.viewController()]
		navigationController.navigationBar.prefersLargeTitles = true
		return navigationController
	}

	func signUpViewController() {
		let presenter = SignUpPresenter()
		navigationController.pushViewController(presenter.viewController(), animated: true)
	}
}
