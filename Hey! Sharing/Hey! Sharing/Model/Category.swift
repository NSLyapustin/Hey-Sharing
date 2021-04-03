//
//  Category.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 24.03.2021.
//

import UIKit

struct Category {
	static var categories: [CategoryModel] = [CategoryModel(name: .all,
															backgroundImage: #imageLiteral(resourceName: "retroAll.jpg")),
											  CategoryModel(name: .vehicle,
															backgroundImage: #imageLiteral(resourceName: "retroCar")),
											  CategoryModel(name: .appliances,
															backgroundImage: #imageLiteral(resourceName: "retroAppliances.JPG")),
											  CategoryModel(name: .electronics,
															backgroundImage: #imageLiteral(resourceName: "retroElectronics.JPG")),
											  CategoryModel(name: .furniture,
															backgroundImage: #imageLiteral(resourceName: "retroFurniture.JPG")),
											  CategoryModel(name: .hobbiesAndLeisure,
															backgroundImage: #imageLiteral(resourceName: "retroHobby")),
											  CategoryModel(name: .clothes,
															backgroundImage: #imageLiteral(resourceName: "retroClothes.JPG"))]
}

struct CategoryModel {
	var name: CategoryName
	var backgroundImage: UIImage
}

enum CategoryName: String, CaseIterable {
	case all = "Все"
	case vehicle = "Транспорт"
	case appliances = "Бытовая техника"
	case electronics = "Электроника"
	case furniture = "Мебель"
	case hobbiesAndLeisure = "Хобби и отдых"
	case clothes = "Одежда"
}


