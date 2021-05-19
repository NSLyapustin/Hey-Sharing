//
//  NetworkService.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 05.05.2021.
//

import Moya

protocol NetworkServiceProtocol {
    var provider: MoyaProvider<MultiTarget> { get }

//    func requset<T: Decodable>(targer: APITargetType, completion: @escaping (Result<T>, Error>) -> ())
}
