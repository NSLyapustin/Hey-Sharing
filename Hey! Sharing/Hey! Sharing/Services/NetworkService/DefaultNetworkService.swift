//
//  DefaultNetworkService.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 22.05.2021.
//

import Foundation
import KeychainAccess

class DefaultNetworkService: NetworkService {

    static var token: String {
        get {
            let keychain = Keychain(service: "http://localhost:8080/signIn")
            return keychain["token"] ?? ""
        }
    }

    static var baseUrl: String {
        get {
            return "http://localhost:8080/"
        }
    }

    static func save(token: String) {
        let keychain = Keychain(service: "http://localhost:8080/signIn")
        keychain["token"] = token
    }
}
