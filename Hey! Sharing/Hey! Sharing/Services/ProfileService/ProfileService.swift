//
//  ProfileService.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 03.03.2021.
//

import UIKit

protocol ProfileService {
    func getUserProducts(completion: @escaping (Result<[Product], NetworkError>) -> Void)
    func getUserIncome(completion: @escaping (Result<Int, NetworkError>) -> Void)
}
