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
	let incomeLabel = UILabel()
	var income: Int? {
		didSet {
			incomeLabel.text = String(describing: income)
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

		whiteCircle.backgroundColor = .red
		whiteCircle.snp.makeConstraints { make in
			make.width.equalToSuperview().dividedBy(2.5)
			make.height.equalTo(whiteCircle.snp.width)
			make.centerX.equalToSuperview()
			make.centerY.equalTo(purpleBox.snp.bottom)
		}
		whiteCircle.layer.cornerRadius = whiteCircle.frame.height / 2
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
