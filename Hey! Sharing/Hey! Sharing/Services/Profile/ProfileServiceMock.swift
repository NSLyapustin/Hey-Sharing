//
//  ProfileServiceMock.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 08.03.2021.
//

import UIKit

class ProfileServiceMock: ProfileService {
    func getUserIncome() -> Double {
        return 941
    }

    func getUserProducts() -> [Product] {
		ProductsStorage.allProducts
    }
}
