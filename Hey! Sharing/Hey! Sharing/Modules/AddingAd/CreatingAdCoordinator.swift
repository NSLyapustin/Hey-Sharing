//
//  AddingAdCoordinator.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 19.04.2021.
//

import UIKit

class CreatingAdCoordinator {
	var navigationController: UINavigationController

	init(navigationController: UINavigationController = UINavigationController()) {
		self.navigationController = navigationController
		navigationController.navigationBar.prefersLargeTitles = true
        let viewController = CreatingAdFactory.makeCreatingAdViewController(from: self)

        navigationController.viewControllers = [viewController]
	}
}
