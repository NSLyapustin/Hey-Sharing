//
//  ResponseProductModel.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 06.05.2021.
//

import Foundation

struct ResponseProductDto: Decodable {
    var id: Int
    var name: String
    var image: String
    var status: String
    var price: Int
    var period: String
    var category: String
}
