//
//  CreatingAdPresenter.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 19.04.2021.
//

import UIKit

class CreatingAdPresenter: CreatingAdViewControllerPresenter {
	private weak var view: CreatingAdViewController?
	private var coordinator: CreatingAdCoordinator?
	private var navigationController: UINavigationController?
    private let addingAdService: AddingService = RestAddingService()

    init(viewController: CreatingAdViewController, coordinator: CreatingAdCoordinator) {
		self.view = viewController
        self.coordinator = coordinator
    }

	func saveAd(name: String, image: UIImage, price: String, period: String, category: String, address: String, description: String) {
		let product = ProductAddingDto(
			name: name,
			image: image,
			price: price,
			forPeriod: period,
			category: category,
			description: description,
			address: address
        )

		addingAdService.saveAd(product: product) { result in
			switch result {
			case .success:
				self.view?.alert(message: "Товар успешно добавлен!", title: "Поздравляем!")
			case .failure:
				self.view?.alert(message: "Не удалось выполнить действие")
			}
		}
    }
}
