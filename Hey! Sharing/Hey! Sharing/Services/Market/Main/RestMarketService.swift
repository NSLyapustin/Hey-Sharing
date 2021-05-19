//
//  RestMarketService.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 06.05.2021.
//
import Alamofire
import KeychainAccess
import UIKit

class RestMarketService: MarketService {
    let keychain = Keychain(service: "http://localhost:8080/signIn")

    func getRecommendations(completion: @escaping ((Result<[Product], MarketError>)) -> ()) {
        guard let token = keychain["token"] else { return }
        let headers: HTTPHeaders = ["Authorization": token]
        DispatchQueue.main.async {
            AF.request("http://localhost:8080/product/getAll", method: .get, headers: headers).validate(statusCode: 200...299).responseDecodable(of: [ResponseProductDto].self) { response in
                switch response.result {
                case .success(let products):
                    let products = products.map { Product.from(networkProduct: $0) }
                    return completion(.success(products))
                case .failure(let error):
                    print(error)
                    return completion(.failure(.badRequest))
                }
            }
        }
    }

    func getRecommendationsInCategory(category: CategoryName, completion: @escaping ((Result<[Product], MarketError>)) -> ()) {
        guard let token = keychain["token"] else { return }
        let headers: HTTPHeaders = ["Authorization": token]
        AF.request("http://localhost:8080/product/getAll/\(category.toEnglish().uppercased())", method: .get, headers: headers).validate(statusCode: 200...299).responseDecodable(of: [ResponseProductDto].self) { response in
            switch response.result {
            case .success(let products):
                let products = products.map { Product.from(networkProduct: $0) }
                return completion(.success(products))
            case .failure(let error):
                print(error)
                return completion(.failure(.badRequest))
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

    private static func category(by name: String) -> CategoryName {
        switch name {
        case "ALL":
            return .all
        case "HOBBIES_AND_LEISURE":
            return .hobbiesAndLeisure
        case "VEHICLE":
            return .vehicle
        case "APPLIANCES":
            return .appliances
        case "ELECTRONICS":
            return .electronics
        case "FURNITURE":
            return .furniture
        case "CLOTHES":
            return .clothes
        default:
            return .all
        }
    }
}
