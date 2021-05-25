//
//  AuthorizationFactory.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 24.05.2021.
//

import UIKit

enum AuthorizationFactory {
    static func makeSignInViewController(from coordinator: AuthorizationCoordinator) -> SignInViewController {
        let viewController = SignInViewController()
        viewController.title = "Вход"
        let presenter = SignInPresenter(viewController: viewController, coordinator: coordinator) {
            coordinator.signUpViewController()
        }
        viewController.presenter = presenter
        return viewController
    }

    static func makeSignUpViewController(from coordinator: AuthorizationCoordinator) -> SignUpViewController {
        let viewController = SignUpViewController()
        viewController.title = "Регистрация"
		let presenter = SignUpPresenter(
            viewController: viewController,
            coordinator: coordinator
        )
        viewController.presenter = presenter
        return viewController
    }
}
