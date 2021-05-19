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

		if isFieldsEmpty(
            name: product.name,
            price: product.price,
            description: product.description,
            period: product.forPeriod,
            category: product.category,
            address: product.address
        ) {
			completion(.failure(.emptyFields))
			return
		}
        guard let token = keychain["token"] else { return }
        var headers: HTTPHeaders = ["Content-type" : "multipart/form-data", "Authorization": token]
        guard let data = product.image.jpegData(compressionQuality: 0.2) else { return }

        let multipartFormData = MultipartFormData()
        multipartFormData.append(data, withName: "image_file", fileName: "image.jpeg", mimeType: "image/jpeg")

        AF.upload(multipartFormData: multipartFormData, to: "http://localhost:8080/product/saveImage", headers: headers).responseDecodable(of:[String : String].self) { response in
            switch response.result {
            case .success(let dictionary):
                let requestProduct = RequestProductModel(product: product, with: dictionary["filePath"] ?? "")
                headers = ["Authorization": token]
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

            case .failure(let error):
                debugPrint(error)
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

