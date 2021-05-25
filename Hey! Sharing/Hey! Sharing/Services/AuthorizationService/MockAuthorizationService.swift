//
//  MockAuthorizationService.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 16.03.2021.
//

import UIKit

class MockAuthorizationService: AuthorizationService {
    func checkAuth(completion: @escaping ((Result<Bool, Error>) -> ())) {
		//
    }

	func signIn(login: String, password: String, completion: @escaping ((Result<Bool, SignInError>) -> Void)) {
		if login.isEmpty || password.isEmpty {
			completion(.failure(.emptyFields))
			return
		}

		guard let rightPassword = UserDefaults.standard.string(forKey: login) else {
			completion(.failure(.incorrectData))
			return
		}

		if rightPassword != password {
			completion(.failure(.incorrectData))
			return
		}

		completion(.success(true))
	}

	func signUp(login: String, password: String, confirmPassword: String, completion: ((Result<Bool, SignUpError>) -> Void)) {
		// guard
		if login.isEmpty || password.isEmpty || confirmPassword.isEmpty {
			completion(.failure(.emptyFields))
			return
		}
		// guard
		if password != confirmPassword {
			completion(.failure(.passwordsMismatch))
			return
		}
		// guard
		if UserDefaults.standard.value(forKey: login) != nil {
			completion(.failure(.loginIsTaken))
			return
		}

		UserDefaults.standard.setValue(password, forKey: login)
		completion(.success(true))
	}
}
