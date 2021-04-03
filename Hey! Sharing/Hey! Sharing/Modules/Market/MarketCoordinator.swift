//
//  MarketCoordinator.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 01.03.2021.
//

import UIKit

class MarketCoordinator: Coordinator {
	var navigationController: UINavigationController

	init(navigationController: UINavigationController = UINavigationController()) {
		self.navigationController = navigationController
		navigationController.navigationBar.prefersLargeTitles = true
		let presenter = MarketPresenterImplementation()

		let viewController = presenter.viewController()

		navigationController.viewControllers = [viewController]
	}

}
