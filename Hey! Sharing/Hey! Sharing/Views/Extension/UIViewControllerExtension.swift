//
//  UIViewControllerExtension.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 24.05.2021.
//

import UIKit

extension UIViewController {
	func alert(message: String, title: String = "Error") {
		let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
		alertController.addAction(OKAction)
		self.present(alertController, animated: true, completion: nil)
	}
}
