//
//  RestAddingService.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 26.04.2021.
//

import UIKit
import Alamofire
import KeychainAccess

class RestAddingService: AddingService {
	let keychain = Keychain(service: "http://localhost:8080/signIn")

	func saveAd(product: ProductAddingDto, completion: @escaping (Result<Bool, AddingError>) -> ()) {

		if isFieldsEmpty(name: product.name,
						 price: product.price,
						 description: product.description,
						 period: product.forPeriod,
						 category: product.category,
						 address: product.address) {
			completion(.failure(.emptyFields))
			return
		}
        let requestProduct = RequestProductModel(product: product)

		guard let token = keychain["token"] else { return }
		let headers: HTTPHeaders = ["Authorization": token]
        AF.request("http://localhost:8080/product/save", method: .post, parameters: requestProduct, encoder: JSONParameterEncoder.default, headers: headers).validate(statusCode: 200..<300).response { response in
			switch response.result {
			case .success( _):
				completion(.success(true))
				return
			case .failure(let error):
                print(error)
				completion(.failure(.badRequest))
				return
			}
		}
	}

	private func isFieldsEmpty(name: String, price: String, description: String, period: String, category: String, address: String) -> Bool {
		if name.isEmpty || category.isEmpty ||
			period.isEmpty || address.isEmpty || description.isEmpty || price.isEmpty {
			return true
		}
		return false
	}
}

