//
//  APIRequest.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 05.05.2021.
//

import Moya

final class APIRequest: APITargetType {

    let authorizationType: AuthorizationType?
    let path: String
    let method: Moya.Method
    let sampleData: Data
    let task: Task
    let headers: [String : String]?


    init(authorizationType: AuthorizationType? = .custom("token"),
         path: String,
         method: Moya.Method,
         task: Task,
         headers: [String: String]? = nil,
         sampleData: Data = Data()
    ) {
        self.authorizationType = authorizationType
        self.path = path
        self.method = method
        self.task = task
        self.headers = headers
        self.sampleData = sampleData
    }
}
