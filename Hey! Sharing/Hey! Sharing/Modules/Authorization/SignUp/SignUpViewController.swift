//
//  SignUpViewController.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 14.03.2021.
//

import UIKit

protocol SignUpViewControllerPresenter {
    func registerUser(login: String, password: String, confirmPassword: String)
}

class SignUpViewController: UIViewController, UITextFieldDelegate {

	let loginTextField = RoundedTextField()
	let passwordTextField = RoundedTextField()
	let confirmPasswordTextField = RoundedTextField()
	let signUpButton = UIButton()
	let errorLabel = UILabel()
	var presenter: SignUpViewControllerPresenter?

	override func viewDidLoad() {
		super.viewDidLoad()
		
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
		signUpButton.addTarget(self, action: #selector(heldDown), for: .touchDown)
		signUpButton.addTarget(self, action: #selector(buttonHeldAndReleased), for: .touchDragExit)
		signUpButton.layer.cornerRadius = 22
		signUpButton.titleLabel?.textColor = .white
		signUpButton.titleLabel?.textAlignment = .center
	}

	@objc func signUpButtonTapped() {
		signUpButton.backgroundColor = UIColor.themeColor
		guard let login = loginTextField.text,
			let password = passwordTextField.text,
			let confirmPassword = confirmPasswordTextField.text else { return }

		presenter?.registerUser(login: login, password: password, confirmPassword: confirmPassword)
	}

	@objc func heldDown() {
		signUpButton.backgroundColor = UIColor.themeColor.withAlphaComponent(0.5)
	}

	@objc func buttonHeldAndReleased() {
		signUpButton.backgroundColor = UIColor.themeColor
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
