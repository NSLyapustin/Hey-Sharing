//
//  AuthorizationService.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 16.03.2021.
//

import Foundation

protocol AuthorizationService {
	func signIn(login: String, password: String, completion: @escaping ((Result<Bool, SignInError>) -> Void))
	func signUp(login: String, password: String, confirmPassword: String, completion: @escaping ((Result<Bool, SignUpError>) -> Void))
}

enum SignInError: Error {
	case incorrectData
	case emptyFields
}

enum SignUpError: Error {
	case loginIsTaken
	case passwordsMismatch
	case emptyFields
}
