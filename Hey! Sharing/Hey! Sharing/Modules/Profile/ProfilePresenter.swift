//
//  Presenter.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 10.03.2021.
//

import UIKit

class ProfilePresenter: ProfileViewControllerPresenter {
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
			case .failure:
				self.view?.alert(message: "Не удалось получить данные")
			}
        }

		profileService.getUserIncome { result in
			switch result {
			case .success(let income):
				self.view?.setIncome(income: income)
			case .failure:
				self.view?.alert(message: "Не удалось получить данные")
			}
		}

        view?.tableView.refreshControl?.endRefreshing()
    }

    init(viewController: ProfileViewController, coordinator: ProfileCoordinator) {
        self.view = viewController
        self.coordinator = coordinator
    }

    func viewDidLoad() {
        loadData()
    }

	func moveToDetail(for productId: Int) {
		coordinator?.detailViewController(with: productId)
	}
}
