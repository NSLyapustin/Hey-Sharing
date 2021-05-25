//
//  StringExtension.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 26.04.2021.
//

import UIKit

extension String {
	func toImage() -> UIImage? {
		if let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters) {
			return UIImage(data: data)
		}
		return nil
	}
}
