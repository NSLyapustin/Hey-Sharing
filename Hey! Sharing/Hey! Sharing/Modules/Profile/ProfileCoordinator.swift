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
        let presenter = ProfilePresenterImplementation()

        let viewController = presenter.viewController()

        navigationController.viewControllers = [viewController]
    }
}
