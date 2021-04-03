//
//  MarketServiceMock.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 24.03.2021.
//

import UIKit

class MarketServiceMock: MarketService {

	func getRecommendations(completion: @escaping ((Result<[Product], MarketError>)) -> ()) {
		completion(.success(ProductsStorage.allProducts))
	}

	func getRecommendationsInCategory(category: CategoryName, completion: @escaping ((Result<[Product], MarketError>)) -> ()) {
		if category == .all {
			completion(.success(ProductsStorage.allProducts))
			return
		}
		var products = ProductsStorage.allProducts
		products = products.filter({ product -> Bool in
			product.category == category
		})
		completion(.success(products))
	}
}
