//
//  MarketService.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 21.03.2021.
//

import UIKit

protocol MarketService {
	func getRecommendations(completion: @escaping ((Result<[Product], MarketError>)) -> ())
	func getRecommendationsInCategory(category: Category, completion: @escaping ((Result<[Product], MarketError>)) -> ())
}

enum MarketError: Error {
	case nothingWasFound
}

