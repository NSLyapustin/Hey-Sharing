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

    let keychain = Keychain(service: "http://localhost:8080/signIn")

    func getUserProducts(completion: @escaping (Result<[Product], Error>) -> ()) {
        guard let token = keychain["token"] else { return }
        let headers: HTTPHeaders = ["Authorization": token]
        AF.request(DefaultNetworkService.baseUrl + "profile/products", method: .get, headers: headers).validate(statusCode: 200...299).responseDecodable(of: [ResponseProductDto].self) { response in
            switch response.result {
            case .success(let products):
                let products = products.map { Product.from(networkProduct: $0) }
                return completion(.success(products))
            case .failure(let error):
                print(error)
                return completion(.failure(error))
            }
        }
    }

    func getUserIncome(completion: @escaping (Result<Int, Error>) -> ()) {
        guard let token = keychain["token"] else { return }
        let headers: HTTPHeaders = ["Authorization": token]
        AF.request(DefaultNetworkService.baseUrl + "profile/income", method: .get, headers: headers).validate(statusCode: 200...299).responseDecodable(of: Int.self) { response in
            switch response.result {
            case .success(let income):
                return completion(.success(income))
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }
}
