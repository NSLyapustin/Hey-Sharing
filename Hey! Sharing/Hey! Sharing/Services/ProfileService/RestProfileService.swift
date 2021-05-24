//
//  RestProfileService.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 19.05.2021.
//

import Alamofire
import Foundation
import KeychainAccess

class RestProfileService: ProfileService {
	func getUserProducts(completion: @escaping (Result<[Product], NetworkError>) -> Void) {
		let token = DefaultNetworkService.token
		let headers: HTTPHeaders = ["Authorization": token]
		AF.request(
			DefaultNetworkService.baseUrl + "profile/products",
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

    func getUserIncome(completion: @escaping (Result<Int, NetworkError>) -> Void) {
		let token = DefaultNetworkService.token
		let headers: HTTPHeaders = ["Authorization": token]
		AF.request(
			DefaultNetworkService.baseUrl + "profile/income",
			method: .get,
			headers: headers)
		.validate(statusCode: 200...299)
		.responseDecodable(of: Int.self) { response in
			switch response.result {
			case .success(let income):
				return completion(.success(income))
			case .failure:
				return completion(.failure(.cantLoadData))
			}
		}
    }
}
