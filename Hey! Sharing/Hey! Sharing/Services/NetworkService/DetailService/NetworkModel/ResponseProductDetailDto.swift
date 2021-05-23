//
//  ResponseProductDetailDto.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 08.05.2021.
//

import Foundation

struct ResponseProductDetailDto: Decodable {
    var id: Int
    var name: String
    var image: String
    var price: Int
    var period: String
    var description: String
    var countOfViews: Int
    var category: String
    var status: String
    var address: String
}
