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
        let presenter = FavoritesPresenter()
        presenter.coordinator = self
        let viewController = presenter.viewController()

        navigationController.viewControllers = [viewController]
    }

    func detailViewController(with id: Int) {
        let presenter = DetailPresenter()
        presenter.productId = id
        let viewController = presenter.viewController()
        navigationController.pushViewController(viewController, animated: true)
    }
}
