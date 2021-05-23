//
//  NetworkService.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 05.05.2021.
//

import Foundation

protocol NetworkService {
    static var token: String { get }
    static var baseUrl: String { get }

    static func save(token: String)
}
