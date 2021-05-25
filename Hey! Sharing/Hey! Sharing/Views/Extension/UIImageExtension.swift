//
//  UIImageExtension.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 26.04.2021.
//

import UIKit

extension UIImage {
	func toString() -> String? {
		let data: Data? = self.pngData()
		return data?.base64EncodedString(options: .endLineWithLineFeed)
	}
}
