//
//  DetailServiceProtocol.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 08.05.2021.
//

import Foundation

protocol DetailService {
    func getDetailProduct(by id: Int, completion: @escaping (Result<ProductDetailDto, DetailError>) -> Void)
	func addToFavorites(id: Int, completion: @escaping (Result<Bool, NetworkError>) -> Void)
}

enum DetailError: Error {
	case networkError
	case badRequest
}
