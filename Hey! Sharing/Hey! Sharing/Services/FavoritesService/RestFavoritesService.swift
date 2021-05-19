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
    let keychain = Keychain(service: "http://localhost:8080/signIn")

    func getFavorites(completion: @escaping (Result<[Product], Error>) -> ()) {
        guard let token = keychain["token"] else { return }
        let headers: HTTPHeaders = ["Authorization": token]
        AF.request("http://localhost:8080/product/favorites", method: .get, headers: headers).validate(statusCode: 200...299).responseDecodable(of: [ResponseProductDto].self) { response in
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

    func addToFavorites(id: Int, completion: @escaping (Result<Bool, Error>) -> ()) {
        guard let token = keychain["token"] else { return }
        let headers: HTTPHeaders = ["Authorization": token]
        AF.request("http://localhost:8080/product/add_to_favorite/\(id)", method: .post, headers: headers).validate(statusCode: 200...299).responseDecodable(of: Bool.self) { response in
            switch response.result {
            case .success(let result):
                return completion(.success(result))
            case .failure(let error):
                print(error)
                return completion(.failure(error))
            }
        }
    }

    func removeFromFavorites(id: Int, completion: @escaping (Result<Bool, Error>) -> ()) {
        guard let token = keychain["token"] else { return }
        let headers: HTTPHeaders = ["Authorization": token]
        AF.request("http://localhost:8080/product/remove_from_favorite/\(id)", method: .post, headers: headers).validate(statusCode: 200...299).responseDecodable(of: Bool.self) { response in
            switch response.result {
            case .success(let result):
                return completion(.success(result))
            case .failure(let error):
                print(error)
                return completion(.failure(error))
            }
        }
    }

}
