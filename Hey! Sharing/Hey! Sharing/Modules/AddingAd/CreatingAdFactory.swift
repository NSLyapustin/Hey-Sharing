//
//  CreatingAdFactory.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 23.05.2021.
//

import UIKit

enum CreatingAdFactory {
	static func makeCreatingAdViewController(from coordinator: CreatingAdCoordinator) -> CreatingAdViewController {
		let viewController = CreatingAdViewController()
		viewController.title = "Добавление"
		viewController.tabBarItem = UITabBarItem(title: "Добавление", image: UIImage(named: "plus.app"), tag: 0)
		let presenter = CreatingAdPresenter(
            viewController: viewController,
            coordinator: coordinator
        )
		viewController.presenter = presenter
		return viewController
    }
}
