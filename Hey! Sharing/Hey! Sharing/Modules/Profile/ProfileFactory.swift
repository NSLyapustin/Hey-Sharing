//
//  ProfileFactory.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 24.05.2021.
//

import UIKit

enum ProfileFactory {
	static func makeProfileViewController(from coordinator: ProfileCoordinator) -> ProfileViewController {
		let viewController = ProfileViewController()
		viewController.title = "Профиль"
		viewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "person.fill"), tag: 0)
		let presenter = ProfilePresenter(
			viewController: viewController,
			coordinator: coordinator
        )
		viewController.presenter = presenter
		return viewController
    }
}
