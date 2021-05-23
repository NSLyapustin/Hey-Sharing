//
//  FavoritesPresenter.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 19.05.2021.
//

import UIKit

class FavoritesPresenter {
    private let favoritesService: FavoritesService = RestFavoritesService()
    private weak var view: FavoritesViewController?
    var products: [Product] = []
    var coordinator: FavoritesCoordinator?
    var moveToDetail: ((String) -> Void)?

    func viewController() -> UIViewController {
        let controller = FavoritesViewController()
        controller.presenter = self
        controller.title = "Избранное"
        controller.tabBarItem = UITabBarItem(title: "Избранное", image: UIImage(named: "heart.fill"), tag: 0)
        view = controller
        setProducts()
        return controller
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
            case .success( _):
                self.setProducts()
            case .failure(let error):
                print(error)
            }
        }
    }

    func moveToDetailViewController(forProductWith id: Int) {
        coordinator?.detailViewController(with: products[id].id)
    }
}
