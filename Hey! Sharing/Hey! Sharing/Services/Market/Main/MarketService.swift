//
//  MarketService.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 21.03.2021.
//

import UIKit

protocol MarketService {
	func getRecommendations(completion: @escaping ((Result<[Product], MarketError>)) -> ())
	func getRecommendationsInCategory(category: CategoryName, completion: @escaping ((Result<[Product], MarketError>)) -> ())
    func addToFavorites(id: Int, completion: @escaping (Result<Bool, Error>) -> ())
}

enum MarketError: Error {
	case nothingWasFound
    case badRequest
}

