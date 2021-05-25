//
//  SignInViewController.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 10.03.2021.
//

import UIKit

protocol SignInViewControllerPresenter {
	func signIn(login: String, password: String)
	var moveToSignUp: (() -> Void)? { get set }
}

class SignInViewController: UIViewController, UITextFieldDelegate {
	let loginTextField = RoundedTextField()
	let passwordTextField = RoundedTextField()
	let signInButton = UIButton()
	let toSignUpButton = UIButton()
	let errorLabel = UILabel()
	var presenter: SignInViewControllerPresenter?

    override func viewDidLoad() {
		super.viewDidLoad()
    }

    override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		setupViews()
    }

    func setupViews() {
		view.addSubview(loginTextField)
		loginTextField.delegate = self
		view.backgroundColor = .white
		loginTextField.snp.makeConstraints { make in
			make.width.equalTo(view.snp.width).multipliedBy(0.9)
			make.height.equalTo(44)
			make.centerX.equalTo(view.snp.centerX)
			make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
		}
		loginTextField.placeholder = "Логин"

		view.addSubview(passwordTextField)
		passwordTextField.delegate = self
		passwordTextField.snp.makeConstraints { make in
			make.width.equalTo(view.snp.width).multipliedBy(0.9)
			make.height.equalTo(44)
			make.centerX.equalTo(view.snp.centerX)
			make.centerY.equalTo(loginTextField.snp.bottom).offset(38)
		}
		passwordTextField.isSecureTextEntry = true
			passwordTextField.placeholder = "Пароль"

		view.addSubview(signInButton)
		signInButton.backgroundColor = UIColor.themeColor
		signInButton.setTitle("Войти", for: .normal)
		signInButton.snp.makeConstraints { make in
			make.width.equalTo(view.snp.width).multipliedBy(0.9)
			make.height.equalTo(44)
			make.centerX.equalTo(view.snp.centerX)
			make.centerY.equalTo(passwordTextField.snp.bottom).offset(38)
		}
		signInButton.layer.cornerRadius = 22
		signInButton.titleLabel?.textColor = .white
		signInButton.titleLabel?.text = "Войти"
		signInButton.titleLabel?.textAlignment = .center
		signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
		signInButton.addTarget(self, action: #selector(heldDown), for: .touchDown)
		signInButton.addTarget(self, action: #selector(buttonHeldAndReleased), for: .touchDragExit)

		view.addSubview(toSignUpButton)
		toSignUpButton.snp.makeConstraints { make in
			make.width.equalTo(140)
			make.centerX.equalTo(view.snp.centerX)
			make.centerY.equalTo(signInButton.snp.bottom).offset(20)
		}
		toSignUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
		toSignUpButton.setTitle("Зарегистрироваться", for: .normal)
		toSignUpButton.setTitleColor(UIColor.themeColor, for: .normal)
		toSignUpButton.addTarget(self, action: #selector(registBtnTapped), for: .touchUpInside)
	}

	@objc private func registBtnTapped() {
		guard let moveToSignUp = presenter?.moveToSignUp else { return }
		moveToSignUp()
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
			make.centerY.equalTo(toSignUpButton.snp.bottom).offset(20)
		}
		errorLabel.font = UIFont.systemFont(ofSize: 12)
		errorLabel.textColor = .red
		errorLabel.textAlignment = .center
		errorLabel.text = error
	}

	@objc func signInButtonTapped() {
		signInButton.backgroundColor = UIColor.themeColor
		guard let login = loginTextField.text, let password = passwordTextField.text else { return }
		presenter?.signIn(login: login, password: password)
	}

	@objc func heldDown() {
		signInButton.backgroundColor = UIColor.themeColor.withAlphaComponent(0.5)
	}

	@objc func buttonHeldAndReleased() {
		signInButton.backgroundColor = UIColor.themeColor
	}
}
