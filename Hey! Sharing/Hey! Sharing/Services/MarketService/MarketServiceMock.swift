//
//  MarketServiceMock.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 24.03.2021.
//

import UIKit

class MarketServiceMock: MarketService {
    func addToFavorites(id: Int, completion: @escaping (Result<Bool, NetworkError>) -> Void) {
		completion(.success(true))
    }


	func getRecommendations(completion: @escaping ((Result<[Product], NetworkError>)) -> Void) {
	}

	func getRecommendationsInCategory(category: CategoryName, completion: @escaping ((Result<[Product], NetworkError>)) -> Void) {
		if category == .all {
			return
		}
	}
}
