//
//  MarketPresenter.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 27.03.2021.
//

import UIKit

class MarketPresenterImplementation: MarketViewControllerPresenter {
	private let marketService: MarketService = RestMarketService()
	private weak var view: MarketViewController?
	var products: [Product] = []
	var coordinator: MarketCoordinator?

    init(viewController: MarketViewController, coordinator: MarketCoordinator) {
		self.view = viewController
		self.coordinator = coordinator
    }

    func viewDidLoad() {
		setProducts()
    }

	func setProducts() {
		marketService.getRecommendations { result in
			switch result {
			case .success(let products):
				self.products = products
				self.view?.setProducts(products: products)
			case .failure:
				self.view?.alert(message: "Не удалось загрузить данные")
			}
		}

		view?.productCollectionView?.refreshControl?.endRefreshing()
	}

	func setProductsByCategory(category: CategoryName) {
		marketService.getRecommendationsInCategory(category: category) { result in
			switch result {
			case .success(let products):
				self.view?.setProducts(products: products)
			case .failure:
				self.view?.alert(message: "Не удалось загрузить данные")
			}
		}
	}

    func addToFavorite(id: Int) {
		marketService.addToFavorites(id: id) { result in
			switch result {
			case .success:
				return
			case .failure:
				self.view?.alert(message: "Не удалось выполнить действие")
			}
		}
    }

    func moveToDetailViewController(forProductWith id: Int) {
		coordinator?.detailViewController(with: products[id].id)
    }
}
