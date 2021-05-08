//
//  DetailPresenter.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 08.05.2021.
//

import UIKit

class DetailPresenter {
    private let detailService: DetailService = RestDetailService()
    private weak var view: DetailViewController?
    var productId: Int?
    var coordinator: MarketCoordinator?
    var moveToDetail: ((String) -> Void)?

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

    func viewController() -> UIViewController {
        let controller = DetailViewController()
        controller.presenter = self
        controller.title = "Объявление"
        view = controller

        guard let id = productId else { return UIViewController() }

        loadProduct(by: id)
        return controller
    }
}
