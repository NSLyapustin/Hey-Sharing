//
//  FavoritesPresenter.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 19.05.2021.
//

import UIKit

class FavoritesPresenter: FavoritesViewControllerPresenter {
    private let favoritesService: FavoritesService = RestFavoritesService()
    private weak var view: FavoritesViewController?
    var products: [Product] = []
    var coordinator: FavoritesCoordinator?
    var moveToDetail: ((String) -> Void)?

    init(viewController: FavoritesViewController, coordinator: FavoritesCoordinator) {
		self.view = viewController
		self.coordinator = coordinator
    }

    func viewDidLoad() {
		setProducts()
    }

    func setProducts() {
		favoritesService.getFavorites { result in
			switch result {
			case .success(let products):
				self.products = products
				self.view?.setProducts(products: products)
			case .failure(let err):
				print(err)
			}
		}

		view?.tableView.refreshControl?.endRefreshing()
    }

    func removeFromFavorites(id: Int) {
        favoritesService.removeFromFavorites(id: id) { result in
			switch result {
			case .success:
				self.setProducts()
			case .failure:
				self.view?.alert(message: "Не удалось выполнить действие")
			}
		}
	}

    func moveToDetailViewController(forProductWith id: Int) {
		coordinator?.detailViewController(with: products[id].id)
    }
}
