//
//  ProfileHeaderCell.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 18.03.2021.
//

import UIKit

class ProfileHeaderView: UIView {
	let purpleBox = UIView()
	let whiteCircle = UIView()
	let incomeView = UIView()
    let incomeLabel: UILabel = {
		var label = UILabel()
		label.tintColor = .black
		label.font = .systemFont(ofSize: 22)
		label.textAlignment = .center
		label.numberOfLines = 0
		return label
    }()
	var income: Int? {
		didSet {
			guard let income = income else { return }
			incomeLabel.text = "Доход:\n\(income)"
		}
	}

	override init(frame: CGRect) {
		super.init(frame: frame)

		addSubview(purpleBox)
		addSubview(whiteCircle)

		purpleBox.backgroundColor = UIColor.themeColor
		purpleBox.snp.makeConstraints { make in
			make.top.equalToSuperview()
			make.trailing.equalToSuperview()
			make.leading.equalToSuperview()
			make.bottom.equalToSuperview().multipliedBy(0.5)
		}

		whiteCircle.backgroundColor = .white
		whiteCircle.snp.makeConstraints { make in
			make.width.equalToSuperview().dividedBy(2.5)
			make.height.equalTo(whiteCircle.snp.width)
			make.centerX.equalToSuperview()
			make.centerY.equalTo(purpleBox.snp.bottom)
		}

		whiteCircle.addSubview(incomeLabel)
        incomeLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(80)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
		whiteCircle.layer.cornerRadius = UIScreen.main.bounds.width / 5
		whiteCircle.layer.borderWidth = 1
		whiteCircle.layer.borderColor = UIColor.themeColor.cgColor
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
