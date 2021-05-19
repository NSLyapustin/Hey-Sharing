//
//  ProductCell.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 08.03.2021.
//

import UIKit
import SnapKit

class ProfileProductCell: UITableViewCell {

    var product: Product? {
        didSet {
            guard let product = product else { return }
            productImageView.image = product.image
            productNameLabel.text = product.name
            productPriceLabel.text = "\(product.price)₽ \(name(of: product.forPeriod))"
            productStatusLabel.text = "\(name(of: product.status))"
        }
    }

    private let productImageView: UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "picturePlaceholder"))
        imgView.contentMode = .scaleAspectFill
		imgView.clipsToBounds = true
        return imgView
    }()

    private let productStatusLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .right
        return lbl
    }()

    private let productNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
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

    private func name(of period: Period) -> String {
		switch period {
		case .day:
			return "в день"
		case .week:
			return "в неделю"
		case .month:
			return "в месяц"
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

	override class func awakeFromNib() {
		print(#function)
	}

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(productImageView)
        addSubview(productNameLabel)
        addSubview(productPriceLabel)
        addSubview(productStatusLabel)

        productImageView.snp.makeConstraints { make in
			make.leading.equalToSuperview().inset(5)
			make.bottom.equalToSuperview().inset(5)
			make.top.equalToSuperview().inset(5)
			make.width.equalTo(90)
			make.height.equalTo(66)
        }
		productImageView.layer.cornerRadius = 10

		productNameLabel.snp.makeConstraints { make in
			make.leading.equalTo(productImageView.snp.trailing).offset(5)
			make.top.equalToSuperview().offset(17)
			make.width.equalToSuperview().dividedBy(3)
		}

        productPriceLabel.snp.makeConstraints { make in
			make.leading.equalTo(productImageView.snp.trailing).offset(5)
			make.top.equalTo(productNameLabel.snp.bottom).offset(10)
			make.width.equalToSuperview().dividedBy(3)
        }

        productStatusLabel.snp.makeConstraints { make in
			make.trailing.equalToSuperview().inset(15)
			make.centerY.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
