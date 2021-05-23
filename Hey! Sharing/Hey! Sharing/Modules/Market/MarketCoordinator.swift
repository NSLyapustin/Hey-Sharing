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
        presenter.coordinator = self
		let viewController = presenter.viewController()
//        let viewController = MarketFactory.marketViewController(from: self)

		navigationController.viewControllers = [viewController]
	}

    func detailViewController(with id: Int) {
        let presenter = DetailPresenter()
        presenter.productId = id
        let viewController = presenter.viewController()
        navigationController.pushViewController(viewController, animated: true)
    }
}
