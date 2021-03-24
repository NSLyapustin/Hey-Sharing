//
//  SignUpViewController.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 14.03.2021.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

	let loginTextField = RoundedTextField()
	let passwordTextField = RoundedTextField()
	let confirmPasswordTextField = RoundedTextField()
	let signUpButton = UIButton()
	let errorLabel = UILabel()
	var presenter: SignUpPresenter?

	override func viewDidLoad() {
		super.viewDidLoad()
		#warning("redo")
//		self.presenter.viewDidLoad()
		
		loginTextField.delegate = self
		passwordTextField.delegate = self
		confirmPasswordTextField.delegate = self
	}

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		navigationController?.navigationBar.prefersLargeTitles = true
		setupViews()
	}

	func setupViews() {
		view.backgroundColor = .white
		view.addSubview(loginTextField)
		loginTextField.snp.makeConstraints { make in
			make.width.equalTo(view.snp.width).multipliedBy(0.9)
			make.height.equalTo(44)
			make.centerX.equalTo(view.snp.centerX)
			make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
		}
		loginTextField.placeholder = "Логин"

		view.addSubview(passwordTextField)
		passwordTextField.snp.makeConstraints { make in
			make.width.equalTo(view.snp.width).multipliedBy(0.9)
			make.height.equalTo(44)
			make.centerX.equalTo(view.snp.centerX)
			make.centerY.equalTo(loginTextField.snp.bottom).offset(38)
		}
		passwordTextField.isSecureTextEntry = true
		passwordTextField.placeholder = "Пароль"

		view.addSubview(confirmPasswordTextField)
		confirmPasswordTextField.snp.makeConstraints { make in
			make.width.equalTo(view.snp.width).multipliedBy(0.9)
			make.height.equalTo(44)
			make.centerX.equalTo(view.snp.centerX)
			make.centerY.equalTo(passwordTextField.snp.bottom).offset(38)
		}
		confirmPasswordTextField.isSecureTextEntry = true
		confirmPasswordTextField.placeholder = "Подтвердите пароль"

		view.addSubview(signUpButton)
		signUpButton.backgroundColor = UIColor.themeColor
		signUpButton.setTitle("Зарегистрироваться", for: .normal)
		signUpButton.snp.makeConstraints { make in
			make.width.equalTo(view.snp.width).multipliedBy(0.9)
			make.height.equalTo(44)
			make.centerX.equalTo(view.snp.centerX)
			make.centerY.equalTo(confirmPasswordTextField.snp.bottom).offset(38)
		}
		signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
		signUpButton.layer.cornerRadius = 22
		signUpButton.titleLabel?.textColor = .white
		signUpButton.titleLabel?.textAlignment = .center
	}

	@objc
	func signUpButtonTapped() {
		guard let login = loginTextField.text, let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text else { return }

		presenter?.registrateUser(login: login, password: password, confirmPassword: confirmPassword)
	}

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}

	func setError(error: String) {
		view.addSubview(errorLabel)
		errorLabel.snp.makeConstraints { make in
			make.width.equalToSuperview().multipliedBy(0.9)
			make.centerX.equalToSuperview()
			make.centerY.equalTo(signUpButton.snp.bottom).offset(20)
		}
		errorLabel.font = UIFont.systemFont(ofSize: 12)
		errorLabel.textColor = .red
		errorLabel.textAlignment = .center
		errorLabel.text = error
	}
}
