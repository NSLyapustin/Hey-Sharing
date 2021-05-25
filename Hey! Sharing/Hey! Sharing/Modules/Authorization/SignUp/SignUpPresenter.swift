//
//  SignUpPresenter.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 16.03.2021.
//

import UIKit

class SignUpPresenter: SignUpViewControllerPresenter {
	private let authorizationService = RestAuthorizationService()
	private weak var view: SignUpViewController?
	var coordinator: AuthorizationCoordinator?
	var moveToSignUp: (() -> Void)?
	var navigationController: UINavigationController?

    init(viewController: SignUpViewController, coordinator: AuthorizationCoordinator) {
        self.view = viewController
        self.coordinator = coordinator
    }

	func registerUser(login: String, password: String, confirmPassword: String) {
		authorizationService.signUp(login: login, password: password, confirmPassword: confirmPassword) { result in
			switch result {
			case .success(_):
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
