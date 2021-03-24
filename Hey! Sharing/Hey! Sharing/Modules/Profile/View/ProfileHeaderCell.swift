//
//  ProfileHeaderCell.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 18.03.2021.
//

import UIKit

class ProfileHeaderCell: UITableViewCell {
	let orangeBox = UIView()
	let whiteCircle = UIView()
	let incomeView = UIView()
	let incomeLabel = UILabel()
	var income: Int? {
		didSet {
			incomeLabel.text = String(describing: income)
		}
	}
	

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		addSubview(orangeBox)
		addSubview(whiteCircle)

		snp.makeConstraints { make in
			make.height.equalTo(170)
		}

		orangeBox.backgroundColor = UIColor.themeColor
		orangeBox.snp.makeConstraints { make in
			make.top.equalToSuperview()
			make.trailing.equalToSuperview()
			make.leading.equalToSuperview()
			make.bottom.equalToSuperview().multipliedBy(0.5)
		}

		whiteCircle.backgroundColor = .white
		whiteCircle.snp.makeConstraints { make in
			make.width.equalToSuperview().dividedBy(3)
			make.height.equalTo(snp.width)
			make.centerX.equalToSuperview()
			make.centerY.equalTo(orangeBox.snp.bottom)
		}
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
