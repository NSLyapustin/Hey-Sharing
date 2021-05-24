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
		let viewController = MarketFactory.makeMarketViewController(from: self)

		navigationController.viewControllers = [viewController]
	}

	func detailViewController(with id: Int) {
		let viewController = DetailFactory.makeDetailViewController(for: id)
		navigationController.pushViewController(viewController, animated: true)
	}
}
