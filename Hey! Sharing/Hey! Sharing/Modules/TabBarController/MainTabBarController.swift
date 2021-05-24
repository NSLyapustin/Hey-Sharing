//
//  MainTabBarController.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 28.02.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    let profileCoordinator = ProfileCoordinator()
    let marketCoordinator = MarketCoordinator()
    let favoritesCoordinator = FavoritesCoordinator()
	let creatingAdCoordinator = CreatingAdCoordinator()

    override func viewDidLoad() {
		super.viewDidLoad()

		viewControllers = [
			marketCoordinator.navigationController,
			creatingAdCoordinator.navigationController,
			favoritesCoordinator.navigationController,
			profileCoordinator.navigationController
		]
    }
}
