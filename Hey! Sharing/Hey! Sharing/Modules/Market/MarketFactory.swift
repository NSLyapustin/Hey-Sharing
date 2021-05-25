//
//  MarketFactory.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 23.05.2021.
//

import UIKit

enum MarketFactory {
    static func makeMarketViewController(from coordinator: MarketCoordinator) -> MarketViewController {
        let viewController = MarketViewController()
        viewController.title = "Главная"
        viewController.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(named: "cart.fill"), tag: 0)
        let presenter = MarketPresenterImplementation(
			viewController: viewController,
			coordinator: coordinator
        )
        viewController.presenter = presenter
        return viewController
    }
}
