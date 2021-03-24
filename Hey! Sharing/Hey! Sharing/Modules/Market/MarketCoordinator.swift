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

        let viewController = MarketViewController.instantiate()
        viewController.title = "Маркет"
        viewController.tabBarItem = UITabBarItem(title: "Маркет", image: UIImage(named: "cart.fill"), tag: 0)
        viewController.coordinator = self

        navigationController.viewControllers = [viewController]
    }
}
