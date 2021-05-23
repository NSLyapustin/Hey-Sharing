//
//  DetailServiceProtocol.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 08.05.2021.
//

import Foundation

protocol DetailService {
    func getDetailProduct(by id: Int, completion: @escaping (Result<ProductDetailDto, DetailError>) -> ())
}

enum DetailError: Error {
    case networkError
    case badRequest
}
