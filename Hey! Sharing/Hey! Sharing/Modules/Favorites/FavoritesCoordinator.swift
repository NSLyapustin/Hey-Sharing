//
//  FavoritesCoordinator.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 19.05.2021.
//

import UIKit

class FavoritesCoordinator {
	var navigationController: UINavigationController

    init(navigationController: UINavigationController = UINavigationController()) {
		self.navigationController = navigationController
		navigationController.navigationBar.prefersLargeTitles = true
		let viewController = FavoritesFactory.makeFavoritesViewController(from: self)

		navigationController.viewControllers = [viewController]
    }

    func detailViewController(with id: Int) {
		let viewController = DetailFactory.makeDetailViewController(for: id)
		navigationController.pushViewController(viewController, animated: true)
    }
}
