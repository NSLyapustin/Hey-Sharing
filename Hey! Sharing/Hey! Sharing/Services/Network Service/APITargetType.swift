//
//  ApiTargetType.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 05.05.2021.
//

import Moya

protocol  APITargetType: AccessTokenAuthorizable, TargetType {}

extension APITargetType {
    var baseURL: URL {
        guard let url = URL(string: "http://localhost:8080") else { fatalError() }
        return url
    }

    var validationType: ValidationType {
        var successCodes: [Int] = []
        successCodes.append(contentsOf: Array(200...299))
        return .customCodes(successCodes)
    }
}

protocol AuthAPITargetType: APITargetType {}
