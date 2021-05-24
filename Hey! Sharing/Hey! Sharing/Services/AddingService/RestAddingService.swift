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
	func saveAd(product: ProductAddingDto, completion: @escaping (Result<Bool, NetworkError>) -> Void) {
		var headers: HTTPHeaders = [
			"Content-type": "multipart/form-data",
			"Authorization": DefaultNetworkService.token
		]
		guard let data = product.image.jpegData(compressionQuality: 0.2) else { return }

		let multipartFormData = MultipartFormData()
		multipartFormData.append(data, withName: "image_file", fileName: "image.jpeg", mimeType: "image/jpeg")

		AF.upload(
			multipartFormData: multipartFormData,
			to: DefaultNetworkService.baseUrl + "product/saveImage",
			headers: headers
		)
		.responseDecodable(of: [String: String].self) { response in
			switch response.result {
			case .success(let dictionary):
				let requestProduct = RequestProductModel(product: product, with: dictionary["filePath"] ?? "")
				headers = ["Authorization": DefaultNetworkService.token]
				self.saveProductBody(requestProduct: requestProduct, headers: headers, completion: completion)
			case .failure:
				return completion(.failure(.cantDoAction))
			}
		}
	}

    private func saveProductBody(requestProduct: RequestProductModel, headers: HTTPHeaders, completion: @escaping (Result<Bool, NetworkError>) -> Void) {
		AF.request(
			DefaultNetworkService.baseUrl + "product/save",
			method: .post,
			parameters: requestProduct,
			encoder: JSONParameterEncoder.default,
			headers: headers
        )
		.validate(statusCode: 200..<300)
		.response { response in
			switch response.result {
			case .success:
				completion(.success(true))
				return
			case .failure:
				completion(.failure(.cantDoAction))
				return
			}
		}
    }

	private func isFieldsEmpty(name: String, price: String, description: String, period: String, category: String, address: String) -> Bool {
		if name.isEmpty || category.isEmpty ||
			period.isEmpty || address.isEmpty ||
			description.isEmpty || price.isEmpty {
			return true
		}
		return false
	}
}
