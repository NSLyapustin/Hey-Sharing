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
	var moveToDetail: ((String) -> Void)?

	func viewController() -> UIViewController {
		let controller = MarketViewController()
		controller.presenter = self
		controller.title = "Главная"
		controller.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(named: "cart.fill"), tag: 0)
		view = controller
		setProducts()
		return controller
	}

	func setProducts() {
		marketService.getRecommendations { result in
			switch result {
			case .success(let products):
                self.products = products
				self.view?.setProducts(products: products)
			case .failure(let err):
				print(err)
			}
		}

        view?.productCollectionView?.refreshControl?.endRefreshing()
	}

	func setProductsByCategory(category: CategoryName) {
		marketService.getRecommendationsInCategory(category: category) { result in
			switch result {
			case .success(let products):
				self.view?.setProducts(products: products)
			case .failure(let err):
				print(err)
			}
		}
	}

    func moveToDetailViewController(forProductWith id: Int) {
        coordinator?.detailViewController(with: products[id].id)
    }
}
