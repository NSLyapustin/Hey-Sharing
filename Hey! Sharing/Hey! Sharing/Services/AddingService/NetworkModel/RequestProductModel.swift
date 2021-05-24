//
//  RequestProductModel.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 06.05.2021.
//

import UIKit

struct RequestProductModel: Encodable {
    let name: String
    let image: String
    let price: Int
    let period: String
    let category: String
    let description: String
    let address: String

    init(product: ProductAddingDto, with imageName: String) {
		self.name = product.name
		self.image = imageName
		self.price = Int(product.price) ?? 0
		self.period = RequestProductModel.nameOf(period: product.forPeriod)
		self.category = RequestProductModel.nameOf(category: product.category)
		self.description = product.description
		self.address = product.address
    }

    private static func nameOf(category: String) -> String {
        switch category {
        case "Хобби и отдых":
			return "HOBBIES_AND_LEISURE"
        case "Все":
			return "ALL"
        case "Транспорт":
			return "VEHICLE"
        case "Бытовая техника":
			return "APPLIANCES"
        case "Электроника":
			return "ELECTRONICS"
        case "Мебель":
			return "FURNITURE"
        case "Одежда":
			return "CLOTHES"
        default:
			return ""
        }
    }

    private static func nameOf(period: String) -> String {
        switch period {
        case "В день":
			return "DAY"
        case "В неделю":
			return "WEEK"
        case "В месяц":
			return "MONTH"
        default:
			return ""
        }
    }
}
