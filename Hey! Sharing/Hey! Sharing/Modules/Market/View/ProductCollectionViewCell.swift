//
//  ProductCollectionViewCell.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 22.03.2021.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
	var product: Product? {
		didSet {
			guard let product = product else { return }
			productImageView.image = product.image
			productNameLabel.text = product.name
			productPriceLabel.text = "\(product.price) \(name(of: product.forPeriod))"
		}
	}

    var addToFavorite: (() -> ())?
	 

	private let productImageView: UIImageView = {
		let imgView = UIImageView()
		imgView.contentMode = .scaleAspectFill
		imgView.clipsToBounds = true
		imgView.layer.cornerRadius = 10
		return imgView
	}()

	private let productNameLabel: UILabel = {
		let lbl = UILabel()
		lbl.textColor = .black
		lbl.font = UIFont.systemFont(ofSize: 16)
		lbl.numberOfLines = 2
		lbl.textAlignment = .left
		return lbl
	}()

	private let productPriceLabel: UILabel = {
		let lbl = UILabel()
		lbl.textColor = .black
		lbl.font = UIFont.systemFont(ofSize: 14)
		lbl.textAlignment = .left
		return lbl
	}()

	private let markAsFavoriteButton: UIButton = {
		let btn = UIButton()
		btn.setTitle("💜", for: .normal)
		return btn
	}()

	private func name(of period: Period) -> String {
		switch period {
		case .day:
			return "день"
		case .week:
			return "неделя"
		case .month:
			return "месяц"
		}
	}

	private func name(of status: Status) -> String {
		switch status {
		case .awaitingСonfirmation:
			return "Ожидает"
		case .atTheReceptionPoint:
			return "В пункте"
		case .atTheTenant:
			return "В аренде"
		}
	}


	override func layoutSubviews() {
		layer.borderWidth = 1
		layer.borderColor = UIColor.systemGray.cgColor
		layer.cornerRadius = 10
		layer.shadowColor = UIColor.black.cgColor
		layer.shadowOpacity = 0.2
		layer.shadowOffset = .zero
		layer.shadowRadius = 5
		backgroundColor = .white

		addSubview(productImageView)
		productImageView.snp.makeConstraints { make in
			make.trailing.equalToSuperview().inset(5)
			make.leading.equalToSuperview().inset(5)
			make.top.equalToSuperview().inset(5)
			make.height.equalTo(productImageView.snp.width).dividedBy(1.5)
		}

		addSubview(markAsFavoriteButton)
		markAsFavoriteButton.snp.makeConstraints { make in
			make.trailing.equalToSuperview().inset(5)
			make.top.equalTo(productImageView.snp.bottom)
		}
        let tap = UITapGestureRecognizer(target: self, action: #selector(favoriteButtonTapped))
        markAsFavoriteButton.addGestureRecognizer(tap)

		addSubview(productNameLabel)
		productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(7.5)
			make.leading.equalToSuperview().inset(5)
			make.trailing.lessThanOrEqualTo(markAsFavoriteButton.snp.leading)
//			make.centerY.equalTo(markAsFavoriteButton)
		}

		addSubview(productPriceLabel)
		productPriceLabel.snp.makeConstraints { make in
			make.bottom.equalToSuperview().inset(5)
			make.leading.equalToSuperview().inset(5)
			make.trailing.equalToSuperview().inset(5)
		}
	}

    @objc private func favoriteButtonTapped() {
        addToFavorite?()
    }
}
