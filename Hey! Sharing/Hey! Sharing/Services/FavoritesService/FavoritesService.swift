//
//  FavoritesService.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 19.05.2021.
//

import Foundation

protocol FavoritesService {
	func getFavorites(completion: @escaping (Result<[Product], NetworkError>) -> Void)
	func addToFavorites(id: Int, completion: @escaping (Result<Bool, NetworkError>) -> Void)
	func removeFromFavorites(id: Int, completion: @escaping (Result<Bool, NetworkError>) -> Void)
}
