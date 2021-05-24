//
//  ProfileCoordinator.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 28.02.2021.
//

import UIKit

class ProfileCoordinator: Coordinator {
    var navigationController: UINavigationController
    init(navigationController: UINavigationController = UINavigationController()) {
		self.navigationController = navigationController
		navigationController.navigationBar.prefersLargeTitles = true
		let viewController = ProfileFactory.makeProfileViewController(from: self)

		navigationController.viewControllers = [viewController]
    }

	func detailViewController(with id: Int) {
		let viewController = DetailFactory.makeDetailViewController(for: id)
		navigationController.pushViewController(viewController, animated: true)
	}

}
