//
//  AddingAdCoordinator.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 19.04.2021.
//

import UIKit

class AddingAdCoordinator {
	var navigationController: UINavigationController

	init(navigationController: UINavigationController = UINavigationController()){
		self.navigationController = navigationController
		let presenter = CreatingAdPresenter()
		presenter.coordinator = self
		navigationController.viewControllers = [presenter.viewController()]
		navigationController.navigationBar.prefersLargeTitles = true
	}
}
