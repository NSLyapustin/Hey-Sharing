//
//  RestFavoritesService.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 19.05.2021.
//

import Alamofire
import Foundation
import KeychainAccess

class RestFavoritesService: FavoritesService {
	func getFavorites(completion: @escaping (Result<[Product], NetworkError>) -> Void) {
		let headers: HTTPHeaders = ["Authorization": DefaultNetworkService.token]
		AF.request(
			DefaultNetworkService.baseUrl + "product/favorites",
			method: .get,
			headers: headers
		)
		.validate(statusCode: 200...299)
		.responseDecodable(of: [ResponseProductDto].self) { response in
			switch response.result {
			case .success(let products):
				let products = products.map { Product.from(networkProduct: $0) }
				return completion(.success(products))
			case .failure:
				return completion(.failure(.cantLoadData))
			}
		}
    }

    func addToFavorites(id: Int, completion: @escaping (Result<Bool, NetworkError>) -> Void) {
		let headers: HTTPHeaders = ["Authorization": DefaultNetworkService.token]
		AF.request(
			DefaultNetworkService.baseUrl + "product/add_to_favorite/\(id)",
			method: .post,
			headers: headers)
			.validate(statusCode: 200...299)
			.responseDecodable(of: Bool.self) { response in
				switch response.result {
				case .success(let result):
					return completion(.success(result))
				case .failure:
					return completion(.failure(.cantDoAction))
			}
		}
    }

    func removeFromFavorites(id: Int, completion: @escaping (Result<Bool, NetworkError>) -> Void) {
		let headers: HTTPHeaders = ["Authorization": DefaultNetworkService.token]
		AF.request(
			DefaultNetworkService.baseUrl + "product/remove_from_favorite/\(id)",
			method: .post,
			headers: headers
		)
		.validate(statusCode: 200...299)
		.responseDecodable(of: Bool.self) { response in
			switch response.result {
			case .success(let result):
				return completion(.success(result))
			case .failure:
				return completion(.failure(.cantDoAction))
			}
		}
    }
}
