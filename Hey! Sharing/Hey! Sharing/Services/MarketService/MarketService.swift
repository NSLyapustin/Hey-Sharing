//
//  MarketService.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 21.03.2021.
//

import UIKit

protocol MarketService {
	func getRecommendations(completion: @escaping ((Result<[Product], NetworkError>)) -> Void)
	func getRecommendationsInCategory(category: CategoryName, completion: @escaping ((Result<[Product], NetworkError>)) -> Void)
    func addToFavorites(id: Int, completion: @escaping (Result<Bool, NetworkError>) -> Void)
}
