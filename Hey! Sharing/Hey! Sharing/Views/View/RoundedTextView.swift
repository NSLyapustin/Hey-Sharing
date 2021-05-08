//
//  RoundedTextView.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 19.04.2021.
//

import UIKit

class RoundedTextView: UITextView {

	init() {
		super.init(frame: CGRect.zero, textContainer: nil)
		backgroundColor = UIColor(displayP3Red: 246 / 255, green: 246 / 255, blue: 246 / 255, alpha: 1)
		layer.borderWidth = 1
		layer.borderColor = UIColor(displayP3Red: 225 / 255, green: 225 / 255, blue: 225 / 255, alpha: 1).cgColor
		layer.cornerRadius = 22
		font = UIFont.systemFont(ofSize: 17)
		self.bounds.origin = CGPoint(x: 10, y: 0)
		textContainerInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
