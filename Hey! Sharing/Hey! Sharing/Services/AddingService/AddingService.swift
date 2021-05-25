//
//  AddingService.swift
//  Hey! Sharing
//
//  Created by Никита Ляпустин on 19.04.2021.
//
//
import UIKit

protocol AddingService {
	func saveAd(product: ProductAddingDto, completion: @escaping (Result<Bool, NetworkError>) -> ())
}
