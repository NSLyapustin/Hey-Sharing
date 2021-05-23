//
//  ProfileServiceMock.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 08.03.2021.
//

import UIKit

class ProfileServiceMock: ProfileService {
    func getUserProducts(completion: @escaping (Result<[Product], Error>) -> ()) {
//        completion(.success(ProductsStorage.allProducts))
    }

    func getUserIncome(completion: @escaping (Result<Int, Error>) -> ()) {
        completion(.success(123))
    }
}
