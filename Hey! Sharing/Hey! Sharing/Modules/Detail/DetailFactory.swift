//
//  DetailFactory.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 24.05.2021.
//

import UIKit

enum DetailFactory {
	static func makeDetailViewController(for productId: Int) -> DetailViewController {
		let viewController = DetailViewController()
		viewController.title = "Объявление"
		let presenter = DetailPresenter(productId: productId, viewController: viewController)
		viewController.presenter = presenter
		return viewController
	}
}
