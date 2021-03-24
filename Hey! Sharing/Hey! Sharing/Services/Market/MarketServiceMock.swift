//
//  MarketServiceMock.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 24.03.2021.
//

import UIKit

class MarketServiceMock: MarketService {
	var products: [Product] = [Product(name: "Макбук1", image: #imageLiteral(resourceName: "mac6"), price: 123, forPeriod: .day, status: .atTheReceptionPoint),
							   Product(name: "Макбук2", image: #imageLiteral(resourceName: "mac5"), price: 234, forPeriod: .week, status: .atTheTenant),
							   Product(name: "Макбук3", image: #imageLiteral(resourceName: "mac3"), price: 345, forPeriod: .week, status: .awaitingСonfirmation),
							   Product(name: "Макбук4", image: #imageLiteral(resourceName: "mac2"), price: 456, forPeriod: .week, status: .atTheReceptionPoint),
							   Product(name: "Макбук5", image: #imageLiteral(resourceName: "mac4"), price: 567, forPeriod: .month, status: .awaitingСonfirmation),
							   Product(name: "Макбук6", image: #imageLiteral(resourceName: "mac1"), price: 678, forPeriod: .month, status: .atTheReceptionPoint),
							   Product(name: "Макбук7", image: #imageLiteral(resourceName: "mac6"), price: 123, forPeriod: .day, status: .atTheReceptionPoint),
							   Product(name: "Макбук8", image: #imageLiteral(resourceName: "mac5"), price: 234, forPeriod: .week, status: .atTheTenant),
							   Product(name: "Макбук9", image: #imageLiteral(resourceName: "mac3"), price: 345, forPeriod: .week, status: .awaitingСonfirmation),
							   Product(name: "Макбук10", image: #imageLiteral(resourceName: "mac2"), price: 456, forPeriod: .week, status: .atTheReceptionPoint),
							   Product(name: "Макбук11", image: #imageLiteral(resourceName: "mac4"), price: 567, forPeriod: .month, status: .awaitingСonfirmation),
							   Product(name: "Макбук12", image: #imageLiteral(resourceName: "mac1"), price: 678, forPeriod: .month, status: .atTheReceptionPoint)]

	func getRecommendations(completion: @escaping ((Result<[Product], MarketError>)) -> ()) {
		completion(.success(products))
	}

	func getRecommendationsInCategory(category: Category, completion: @escaping ((Result<[Product], MarketError>)) -> ()) {
		
	}
}
