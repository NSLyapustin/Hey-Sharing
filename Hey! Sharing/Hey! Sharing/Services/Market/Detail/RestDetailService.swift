//
//  RestDetailService.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 08.05.2021.
//

import UIKit
import Alamofire
import KeychainAccess

class RestDetailService: DetailService {
    let keychain = Keychain(service: "http://localhost:8080/signIn")

    func getDetailProduct(by id: Int, completion: @escaping (Result<ProductDetailDto, DetailError>) -> ()) {
        guard let token = keychain["token"] else { return }
        let headers: HTTPHeaders = ["Authorization": token]
        AF.request("http://localhost:8080/product/\(id)", method: .get, headers: headers).validate(statusCode: 200...299).responseDecodable(of: ResponseProductDetailDto.self) { response in
            switch response.result {
            case .success(let product):
                let product = ProductDetailDto.from(networkProduct: product)
                return completion(.success(product))
            case .failure(let error):
                print(error)
                completion(.failure(.networkError))
            }
        }
    }
}
