//
//  RoundedTextField.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 10.03.2021.
//

import UIKit

class RoundedTextField: UITextField {
	override func textRect(forBounds bounds: CGRect) -> CGRect {
		bounds.insetBy(dx: 10, dy: 0)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
		textRect(forBounds: bounds)
    }

	init() {
		super.init(frame: CGRect())
		backgroundColor = UIColor(displayP3Red: 246 / 255, green: 246 / 255, blue: 246 / 255, alpha: 1)
		layer.borderWidth = 1
		layer.borderColor = UIColor(displayP3Red: 225 / 255, green: 225 / 255, blue: 225 / 255, alpha: 1).cgColor
		layer.cornerRadius = 22
    }

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
