//
//  FavoritesService.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 19.05.2021.
//

import Foundation

protocol FavoritesService {
    func getFavorites(completion: @escaping (Result<[Product], Error>) -> ())
    func addToFavorites(id: Int, completion: @escaping (Result<Bool, Error>) -> ())
    func removeFromFavorites(id: Int, completion: @escaping (Result<Bool, Error>) -> ())
}
