//
//  Category.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 24.03.2021.
//

import UIKit

enum Category {
	static var categories: [CategoryModel] = [
		CategoryModel(name: .all, backgroundImage: UIImage(named: "retroAll")),
		CategoryModel(name: .vehicle, backgroundImage: UIImage(named: "retroCar")),
		CategoryModel(name: .appliances, backgroundImage: UIImage(named: "retroAppliances")),
		CategoryModel(name: .electronics, backgroundImage: UIImage(named: "retroElectronics")),
		CategoryModel(name: .furniture, backgroundImage: UIImage(named: "retroFurniture")),
		CategoryModel(name: .hobbiesAndLeisure, backgroundImage: UIImage(named: "retroHobby")),
		CategoryModel(name: .clothes, backgroundImage: UIImage(named: "retroClothes"))
	]
}

struct CategoryModel {
	var name: CategoryName
	var backgroundImage: UIImage?
}

enum CategoryName: String, CaseIterable {
	case all = "Все"
	case vehicle = "Транспорт"
	case appliances = "Бытовая техника"
	case electronics = "Электроника"
	case furniture = "Мебель"
	case hobbiesAndLeisure = "Хобби и отдых"
	case clothes = "Одежда"

    func toEnglish() -> String {
		switch self {
		case .all:
			return "all"
		case .vehicle:
			return "vehicle"
		case .appliances:
			return "appliances"
		case .electronics:
			return "electronics"
		case .furniture:
			return "furniture"
		case .hobbiesAndLeisure:
			return "hobbies_And_Leisure"
		case .clothes:
			return "clothes"
        }
    }
}
