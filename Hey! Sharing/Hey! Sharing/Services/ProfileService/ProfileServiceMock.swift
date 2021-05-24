//
//  ProfileServiceMock.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 08.03.2021.
//

import UIKit

class ProfileServiceMock: ProfileService {
    func getUserProducts(completion: @escaping (Result<[Product], NetworkError>) -> Void) {
    }

    func getUserIncome(completion: @escaping (Result<Int, NetworkError>) -> Void) {
        completion(.success(123))
    }
}
