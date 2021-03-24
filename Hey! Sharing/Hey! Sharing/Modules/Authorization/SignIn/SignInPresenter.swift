//
//  SignInPresenter.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 15.03.2021.
//

import UIKit

class SignInPresenter {
	private let authorizationService = MockAuthorizationService()
	private weak var view: SignInViewController?
	var coordinator: AuthorizationCoordinator?
	var moveToSignUp: (() -> Void)?
	var navigationController: UINavigationController?

	func viewController() -> UIViewController {
		let controller: SignInViewController = SignInViewController()
		controller.presenter = self
		view = controller
		controller.title = "Вход"
		navigationController?.pushViewController(controller, animated: true)
		return controller
	}

	func signIn(login: String, password: String) {
		authorizationService.signIn(login: login, password: password) { result in
			switch result {
			case .success(_):
				self.view?.dismiss(animated: true, completion: nil)
				guard let authorizationIsFinished = self.coordinator?.authorizationIsFinished
					else { return }
				authorizationIsFinished()
			case .failure(.emptyFields):
				self.view?.setError(error: "Пожалуйста, заполните поля")
			case .failure(.incorrectData):
				self.view?.setError(error: "Введены неверные данные")
			}
		}
	}
}
