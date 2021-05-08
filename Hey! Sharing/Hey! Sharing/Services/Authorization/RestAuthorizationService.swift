//
//  AuthorizationServiceImpl.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 19.04.2021.
//

import UIKit
import Alamofire
import KeychainAccess

class RestAuthorizationService: AuthorizationService {

	let keychain = Keychain(service: "http://localhost:8080/signIn")

	func signIn(login: String, password: String, completion: @escaping ((Result<Bool, SignInError>) -> Void)) {
		if (login.isEmpty || password.isEmpty) {
			completion(.failure(.emptyFields))
			return
		}
		let parameters = ["username": login, "password": password]
		AF.request("http://localhost:8080/signIn", method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).validate(statusCode: 200..<300).responseDecodable(of: Dictionary<String, String>.self) { response in
			switch response.result {
			case .success:
				self.keychain["token"] = response.value?["token"]
				completion(.success(true))
				return
			case .failure:
				completion(.failure(.incorrectData))
				return
			}
		}
	}

	func signUp(login: String, password: String, confirmPassword: String, completion: @escaping ((Result<Bool, SignUpError>) -> Void)) {
		if (login.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
			completion(.failure(.emptyFields))
			return
		}
		if password != confirmPassword {
			completion(.failure(.passwordsMismatch))
			return
		}
		let parameters = ["username": login, "password": password]
		AF.request("http://localhost:8080/signUp", method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).validate(statusCode: 200..<300).responseJSON { response in
			switch response.result {
			case .success( _):
				completion(.success(true))
				return
			case .failure(let error):
				print(error)
				completion(.failure(.loginIsTaken))
				return
			}
		}
	}
}
