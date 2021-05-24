//
//  SignInPresenter.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 15.03.2021.
//

import UIKit

class SignInPresenter: SignInViewControllerPresenter {
	private let authorizationService = RestAuthorizationService()
	private weak var view: SignInViewController?
	var coordinator: AuthorizationCoordinator?
	var moveToSignUp: (() -> Void)?
	var navigationController: UINavigationController?

    init(viewController: SignInViewController, coordinator: AuthorizationCoordinator, moveToSignUp: @escaping () -> Void) {
        self.view = viewController
        self.coordinator = coordinator
        self.moveToSignUp = moveToSignUp
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
