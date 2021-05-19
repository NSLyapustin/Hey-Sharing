//
//  ProfileService.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 03.03.2021.
//

import UIKit

protocol ProfileService {
    func getUserProducts(completion: @escaping (Result<[Product], Error>) -> ())
    func getUserIncome(completion: @escaping (Result<Int, Error>) -> ())
}

enum ProfileError: Error {
    case nothingWasFound
    case badRequest
}
