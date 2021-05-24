//
//  ProductDetailModel.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 21.03.2021.
//

import UIKit

struct ProductDetailDto {
	var id: Int
	var name: String
	var imageName: String
	var price: Int
	var forPeriod: Period
	var description: String
	var countOfViews: Int
	var category: CategoryName
	var status: Status
	var address: String

    init(id: Int, name: String, imageName: String, price: Int, forPeriod: Period, status: Status, description: String, countOfViews: Int, category: CategoryName, address: String) {
		self.id = id
		self.name = name
		self.imageName = imageName
		self.price = price
		self.forPeriod = forPeriod
		self.description = description
		self.address = address
		self.status = status
		self.category = category
		self.countOfViews = countOfViews
    }

    static func from(networkProduct: ResponseProductDetailDto) -> ProductDetailDto {
		return ProductDetailDto(
			id: networkProduct.id,
			name: networkProduct.name,
			imageName: networkProduct.image,
			price: networkProduct.price,
			forPeriod: period(by: networkProduct.period),
			status: status(by: networkProduct.status),
			description: networkProduct.description,
			countOfViews: networkProduct.countOfViews,
			category: category(by: networkProduct.category),
			address: networkProduct.address
        )
    }

    private static func getImage(from string: String) -> UIImage {
		guard let image = string.toImage() else {
			return #imageLiteral(resourceName: "picturePlaceholder")
        }

        return image
    }

    private static func category(by name: String) -> CategoryName {
		switch name {
		case "ALL":
			return .all
		case "HOBBIES_AND_LEISURE":
			return .hobbiesAndLeisure
		case "VEHICLE":
			return .vehicle
		case "APPLIANCES":
			return .appliances
		case "ELECTRONICS":
			return .electronics
		case "FURNITURE":
			return .furniture
		case "CLOTHES":
			return .clothes
		default:
			return .all
        }
    }

    private static func period(by name: String) -> Period {
		switch name {
		case "DAY":
			return .day
		case "WEEK":
			return .week
		case "MONTH":
			return .month
		default:
			return .day
        }
    }

    private static func status(by name: String) -> Status {
		switch name {
		case "AT_THE_TENANT":
			return .atTheTenant
		case "AWAITING_CONFIRMATION":
			return .awaitingСonfirmation
		case "AT_THE_RECEPTION_POINT":
			return .atTheReceptionPoint
		default:
			return .awaitingСonfirmation
        }
    }
}
