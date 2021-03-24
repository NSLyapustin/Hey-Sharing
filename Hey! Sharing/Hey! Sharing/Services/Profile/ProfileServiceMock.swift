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
        var products: [Product] = []
        products.append(Product(name: "Макбук1", image: #imageLiteral(resourceName: "mac6"), price: 123, forPeriod: .day, status: .atTheReceptionPoint))
        products.append(Product(name: "Макбук2", image: #imageLiteral(resourceName: "mac5"), price: 234, forPeriod: .week, status: .atTheTenant))
        products.append(Product(name: "Макбук3", image: #imageLiteral(resourceName: "mac3"), price: 345, forPeriod: .week, status: .awaitingСonfirmation))
        products.append(Product(name: "Макбук4", image: #imageLiteral(resourceName: "mac2"), price: 456, forPeriod: .week, status: .atTheReceptionPoint))
		products.append(Product(name: "Макбук5", image: #imageLiteral(resourceName: "mac4"), price: 567, forPeriod: .month, status: .awaitingСonfirmation))
		products.append(Product(name: "Макбук6", image: #imageLiteral(resourceName: "mac1"), price: 678, forPeriod: .month, status: .atTheReceptionPoint))
        products.append(Product(name: "Макбук7", image: #imageLiteral(resourceName: "mac6"), price: 123, forPeriod: .day, status: .atTheReceptionPoint))
        products.append(Product(name: "Макбук8", image: #imageLiteral(resourceName: "mac5"), price: 234, forPeriod: .week, status: .atTheTenant))
        products.append(Product(name: "Макбук9", image: #imageLiteral(resourceName: "mac3"), price: 345, forPeriod: .week, status: .awaitingСonfirmation))
        products.append(Product(name: "Макбук10", image: #imageLiteral(resourceName: "mac2"), price: 456, forPeriod: .week, status: .atTheReceptionPoint))
		products.append(Product(name: "Макбук11", image: #imageLiteral(resourceName: "mac4"), price: 567, forPeriod: .month, status: .awaitingСonfirmation))
		products.append(Product(name: "Макбук12", image: #imageLiteral(resourceName: "mac1"), price: 678, forPeriod: .month, status: .atTheReceptionPoint))

        return products
    }
}
