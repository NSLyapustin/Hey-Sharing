//
//  FavoritesFactory.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 24.05.2021.
//

import UIKit

enum FavoritesFactory {
	static func makeFavoritesViewController(from coordinator: FavoritesCoordinator) -> FavoritesViewController {
		let viewController = FavoritesViewController()
		viewController.title = "Избранное"
		viewController.tabBarItem = UITabBarItem(title: "Избранное", image: UIImage(named: "heart.fill"), tag: 0)
		let presenter = FavoritesPresenter(
			viewController: viewController,
			coordinator: coordinator
        )
		viewController.presenter = presenter
		return viewController
    }
}
