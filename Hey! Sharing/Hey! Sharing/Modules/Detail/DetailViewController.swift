//
//  DetailViewController.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 27.03.2021.
//

import UIKit
import SnapKit

protocol DetailViewControllerPresenter {
	func viewDidLoad()
	func loadProduct(by id: Int)
	func addToFavorite(id: Int)
}

class DetailViewController: UIViewController {
	private let productImageView = UIImageView()
	private let nameLabel = UILabel()
	private let priceLabel = UILabel()
	private let statusLabel = UILabel()
	private let descriptionLabel = UILabel()
	private let addressLabel = UILabel()
	private let countOfViewsLabel = UILabel()
	private let favoriteButton = UIButton()

    var presenter: DetailPresenter?
	var product: ProductDetailDto?

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.navigationBar.prefersLargeTitles = false
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		presenter?.viewDidLoad()
		setup()
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)

		navigationController?.navigationBar.prefersLargeTitles = true
	}

    func set(product: ProductDetailDto) {
		self.product = product
		let url = URL(string: "http://localhost:8080/image/\(product.imageName)")
		productImageView.kf.setImage(with: url)
		nameLabel.text = product.name
		priceLabel.text = "\(product.price) P"
		statusLabel.text = {
			switch product.status {
			case .awaitingСonfirmation:
				return "Ожидает подтверждения по адресу:"
			case .atTheReceptionPoint:
				return "Находится в пункте по адресу:"
			case .atTheTenant:
				return "В аренде, будет по адресу:"
            }
        }()
        descriptionLabel.text = product.description
        addressLabel.text = product.address
        countOfViewsLabel.text = "\(product.countOfViews)"
    }

	func setup() {
		view.backgroundColor = .white
		let scrollView = UIScrollView()
		view.addSubview(scrollView)
		scrollView.snp.makeConstraints { make in
			make.leading.bottom.trailing.equalToSuperview()
			make.top.equalTo(view.safeAreaLayoutGuide)
		}

		scrollView.addSubview(productImageView)
		productImageView.snp.makeConstraints { make in
			make.top.equalToSuperview()
			make.width.equalToSuperview()
			make.height.equalTo(productImageView.snp.width).dividedBy(1.5)
		}

		scrollView.addSubview(nameLabel)
		nameLabel.snp.makeConstraints { make in
			make.top.equalTo(productImageView.snp.bottom).offset(10)
			make.width.equalToSuperview().multipliedBy(0.95)
			make.centerX.equalToSuperview()
		}
		nameLabel.numberOfLines = 0
		nameLabel.font = UIFont.systemFont(ofSize: 22)

		scrollView.addSubview(priceLabel)
		priceLabel.snp.makeConstraints { make in
			make.top.equalTo(nameLabel.snp.bottom).offset(10)
			make.width.equalToSuperview().multipliedBy(0.95)
			make.centerX.equalToSuperview()
			make.height.equalTo(35)
		}
		priceLabel.font = UIFont(name: "Helvetica", size: 24)

		let priceLine = UIView()
		priceLabel.addSubview(priceLine)
		priceLine.snp.makeConstraints { make in
			make.leading.equalToSuperview().offset(-5)
			make.height.equalToSuperview()
			make.width.equalTo(2)
		}
		priceLine.backgroundColor = .purple

		scrollView.addSubview(statusLabel)
		statusLabel.snp.makeConstraints { make in
			make.top.equalTo(priceLabel.snp.bottom).offset(10)
			make.width.equalToSuperview().multipliedBy(0.95)
			make.centerX.equalToSuperview()
		}
		statusLabel.numberOfLines = 0

		scrollView.addSubview(addressLabel)
		addressLabel.snp.makeConstraints { make in
			make.top.equalTo(statusLabel.snp.bottom)
			make.width.equalToSuperview().multipliedBy(0.95)
			make.centerX.equalToSuperview()
			make.height.equalTo(35)
		}

		let statusLine = UIView()
		addressLabel.addSubview(statusLine)
		statusLine.snp.makeConstraints { make in
			make.leading.equalToSuperview().offset(-5)
			make.top.equalTo(statusLabel)
			make.bottom.equalTo(addressLabel)
			make.width.equalTo(2)
		}
		statusLine.backgroundColor = .purple

		scrollView.addSubview(descriptionLabel)
		descriptionLabel.snp.makeConstraints { make in
			make.top.equalTo(addressLabel.snp.bottom).offset(10)
			make.width.equalToSuperview().multipliedBy(0.95)
			make.centerX.equalToSuperview()
		}
		descriptionLabel.numberOfLines = 0

		let descriptionLine = UIView()
		descriptionLabel.addSubview(descriptionLine)
		descriptionLine.snp.makeConstraints { make in
			make.leading.equalToSuperview().offset(-5)
			make.height.equalToSuperview()
			make.width.equalTo(2)
		}
		descriptionLine.backgroundColor = .purple

		scrollView.addSubview(favoriteButton)
		favoriteButton.snp.makeConstraints { make in
			make.top.equalTo(descriptionLabel.snp.bottom).offset(10)
			make.width.equalToSuperview().multipliedBy(0.9)
			make.centerX.equalToSuperview()
			make.height.equalTo(35)
			make.bottom.equalToSuperview().inset(10)
		}
		favoriteButton.setTitle("В избранное!", for: .normal)
		favoriteButton.backgroundColor = .purple
		favoriteButton.layer.cornerRadius = 5
		favoriteButton.titleLabel?.textColor = .white
		favoriteButton.titleLabel?.textAlignment = .center

		favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
		favoriteButton.addTarget(self, action: #selector(heldDown), for: .touchDown)
		favoriteButton.addTarget(self, action: #selector(buttonHeldAndReleased), for: .touchDragExit)
	}

	@objc private func favoriteButtonTapped(sender: UIButton) {
		favoriteButton.backgroundColor = UIColor.themeColor
		guard let id = product?.id else { return }
		presenter?.addToFavorite(id: id)
	}

	@objc func heldDown() {
		favoriteButton.backgroundColor = UIColor.themeColor.withAlphaComponent(0.5)
	}

	@objc func buttonHeldAndReleased() {
		favoriteButton.backgroundColor = UIColor.themeColor
	}
}
