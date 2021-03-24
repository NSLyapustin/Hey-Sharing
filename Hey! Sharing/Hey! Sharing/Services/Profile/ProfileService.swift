//
//  ProfileService.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 03.03.2021.
//

import UIKit

protocol ProfileService {
    func getUserProducts() -> [Product]
    func getUserIncome() -> Double
}
