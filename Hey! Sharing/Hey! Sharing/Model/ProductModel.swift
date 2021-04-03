//
//  Add.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 03.03.2021.
//

import UIKit

struct Product {
    var name: String
    var image: UIImage
    var price: Int
    var forPeriod: Period
    var status: Status
	var category: CategoryName

    enum Status {
		case awaitingСonfirmation
		case atTheReceptionPoint
		case atTheTenant
    }

    enum Period {
		case day
		case week
		case month
    }
}
