//
//  Presenter.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 10.03.2021.
//

import UIKit

class ProfilePresenterImplementation: ProfilePresenter {

    private let profileService: ProfileService = ProfileServiceMock()
    private var view: ProfileViewController?
    var products: [Product] = []
    var coordinator: ProfileCoordinator?
    var moveToDetail: ((String) -> Void)?

    func loadData() {
		view?.set(products: profileService.getUserProducts())
    }

    func viewController() -> UIViewController {
		let controller = ProfileViewController()
		controller.presenter = self
		controller.title = "Профиль"
		controller.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "person.fill"), tag: 0)
		view = controller
		loadData()
        return controller
    }
}
