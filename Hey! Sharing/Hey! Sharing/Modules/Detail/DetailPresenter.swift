//
//  DetailPresenter.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 08.05.2021.
//

import UIKit

class DetailPresenter: DetailViewControllerPresenter {
	private let detailService: DetailService = RestDetailService()
    private weak var view: DetailViewController?
    var productId: Int?
    var moveToDetail: ((String) -> Void)?

	init(productId: Int, viewController: DetailViewController) {
		self.view = viewController
		self.productId = productId
	}

	func viewDidLoad() {
		loadProduct(by: productId ?? 0)
	}

    func loadProduct(by id: Int) {
		detailService.getDetailProduct(by: id) { result in
			switch result {
			case .success(let product):
				self.view?.set(product: product)
			case .failure(let error):
				print(error)
			}
		}
    }

	func addToFavorite(id: Int) {
		detailService.addToFavorites(id: id) { result in
			switch result {
			case .success:
				self.view?.alert(message: "Товар успешно добавлен в избранное!", title: "Поздравляем!")
			case .failure:
				self.view?.alert(message: "Не удалось выполнить действие")
			}
		}
	}
}
