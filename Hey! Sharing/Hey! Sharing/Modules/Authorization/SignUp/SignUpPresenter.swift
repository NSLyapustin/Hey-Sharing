//
//  SignUpPresenter.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 16.03.2021.
//

import UIKit

class SignUpPresenter {
	private let authorizationService = MockAuthorizationService()
	private weak var view: SignUpViewController?
	var coordinator: AuthorizationCoordinator?
	var moveToSignUp: (() -> Void)?
	var navigationController: UINavigationController?

	func viewController() -> UIViewController {
		let controller = SignUpViewController()
		controller.presenter = self
		view = controller
		controller.title = "Регистрация"
		navigationController?.pushViewController(controller, animated: true)
		return controller
	}

	func registrateUser(login: String, password: String, confirmPassword: String) {
		authorizationService.signUp(login: login, password: password, confirmPassword: confirmPassword) { result in
			switch result {
			case .success(_):
//				guard let presentingViewControler = self.view?.presentingViewController as? SignInViewController else { fatalError("check") }
//				presentingViewControler.loginTextField.text = login
//				presentingViewControler.passwordTextField.text = password
				self.view?.navigationController?.popViewController(animated: true)
			case .failure(.emptyFields):
				self.view?.setError(error: "Пожалуйста, заполните поля")
			case .failure(.loginIsTaken):
				self.view?.setError(error: "Логин уже занят")
			case .failure(.passwordsMismatch):
				self.view?.setError(error: "Пароли не совпадают")
			}
		}
	}
}
