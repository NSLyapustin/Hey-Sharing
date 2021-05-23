//
//  CreatingAdPresenter.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 19.04.2021.
//

import UIKit

class CreatingAdPresenter {
//	private let authorizationService = MockAuthorizationService()
	private weak var view: CreatingAdViewController?
	var coordinator: AddingAdCoordinator?
//	var moveToSignUp: (() -> Void)?
	var navigationController: UINavigationController?

	func viewController() -> UIViewController {
		let controller = CreatingAdViewController()
		controller.presenter = self
		view = controller
		controller.title = "Добавление"
		controller.tabBarItem = UITabBarItem(title: "Добавление", image: UIImage(named: "plus.app"), tag: 0)
		navigationController?.pushViewController(controller, animated: true)
		return controller
	}
}
