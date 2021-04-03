//
//  ProductsStorage.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 26.03.2021.
//

import UIKit

struct ProductsStorage {
	static let allProducts: [Product] = [Product(name: "Макбук про 13", image: #imageLiteral(resourceName: "mac1"), price: 4000, forPeriod: .week, status:
													.atTheReceptionPoint, category: .electronics),
										 Product(name: "Носки", image: #imageLiteral(resourceName: "retroCar"), price: 200, forPeriod: .week, status: .atTheTenant, category: .clothes),
										 Product(name: "Шкаф", image: #imageLiteral(resourceName: "mac5"), price: 1000, forPeriod: .month, status: .awaitingСonfirmation, category: .furniture),
										 Product(name: "Форд Мустанг", image: #imageLiteral(resourceName: "retroCar"), price: 20000, forPeriod: .month, status: .atTheTenant, category: .vehicle),
										 Product(name: "Синтезатор", image: #imageLiteral(resourceName: "mac4"), price: 1000, forPeriod: .week, status: .atTheReceptionPoint, category: .hobbiesAndLeisure),
										 Product(name: "Лексус", image: #imageLiteral(resourceName: "mac6"), price: 30000, forPeriod: .month, status: .awaitingСonfirmation, category: .vehicle),
										 Product(name: "Стиральная машинка", image: #imageLiteral(resourceName: "retroClothes"), price: 1000, forPeriod: .week, status: .atTheTenant, category: .appliances),
										 Product(name: "Гиатара Гибсон", image: #imageLiteral(resourceName: "retroAppliances"), price: 1234, forPeriod: .week, status: .atTheTenant, category: .hobbiesAndLeisure),
										 Product(name: "Диван", image: #imageLiteral(resourceName: "retroFurniture"), price: 700, forPeriod: .month, status: .atTheReceptionPoint, category: .furniture),
										 Product(name: "Футболка", image: #imageLiteral(resourceName: "retroHobby"), price: 120, forPeriod: .week, status: .awaitingСonfirmation, category: .clothes),
										 Product(name: "Утюг", image: #imageLiteral(resourceName: "mac1"), price: 200, forPeriod: .week, status: .atTheTenant, category: .appliances),
										 Product(name: "Телевизор", image: #imageLiteral(resourceName: "mac4"), price: 1221, forPeriod: .week, status: .awaitingСonfirmation, category: .electronics),
										 Product(name: "Плед", image: #imageLiteral(resourceName: "mac5"), price: 70, forPeriod: .day, status: .atTheReceptionPoint, category: .furniture),
										 Product(name: "Кровать", image: #imageLiteral(resourceName: "retroFurniture"), price: 3000, forPeriod: .week, status: .atTheTenant, category: .furniture),
										 Product(name: "Спортивная лента", image: #imageLiteral(resourceName: "mac4"), price: 100, forPeriod: .day, status: .atTheReceptionPoint, category: .hobbiesAndLeisure),
										 Product(name: "Стол", image: #imageLiteral(resourceName: "retroCar"), price: 1000, forPeriod: .week, status: .awaitingСonfirmation, category: .furniture),
										 Product(name: "Мяч футбольный", image: #imageLiteral(resourceName: "retroElectronics"), price: 100, forPeriod: .day, status: .atTheTenant, category: .hobbiesAndLeisure),
										 Product(name: "Шуруповёрт", image: #imageLiteral(resourceName: "retroAppliances"), price: 1200, forPeriod: .week, status: .atTheTenant, category: .appliances),]

}
