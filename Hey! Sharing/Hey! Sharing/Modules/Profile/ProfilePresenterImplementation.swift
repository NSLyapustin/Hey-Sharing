//
//  Presenter.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 10.03.2021.
//

import UIKit

class ProfilePresenterImplementation: ProfilePresenter {

    private let profileService: ProfileService = RestProfileService()
    private weak var view: ProfileViewController?
    var products: [Product] = []
    var coordinator: ProfileCoordinator?
    var moveToDetail: ((String) -> Void)?

    func loadData() {
        profileService.getUserProducts { result in
            switch result {
            case .success(let products):
                self.view?.setProducts(products: products)
            case .failure(let err):
                print(err)
            }
        }

        profileService.getUserIncome { result in
            switch result {
            case .success(let income):
                self.view?.setIncome(income: income)
            case .failure(let error):
                print(error)
            }
        }
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
