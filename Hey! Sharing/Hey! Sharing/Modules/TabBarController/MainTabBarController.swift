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
	let addingAdCoordinator = AddingAdCoordinator()

    override func viewDidLoad() {
		super.viewDidLoad()

        viewControllers = [marketCoordinator.navigationController, addingAdCoordinator.navigationController, favoritesCoordinator.navigationController, profileCoordinator.navigationController]
    }
}