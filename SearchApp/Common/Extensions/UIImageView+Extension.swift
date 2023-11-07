//
//  UIImageView+Extension.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

import Kingfisher
import UIKit
import OSLog

extension UIImageView {
	
	/**
	 * Function to get an UIImageView from URL using Kingfisher library.
	 */
	func setImageFromURL(_ url: URL?) {
		guard let url = url else {
			Logger.kingfisher.error("Error creating URL")
			return
		}
		
		setupImageResource(url)
	}
	
	private func setupImageResource(_ url: URL, placeHolder: Placeholder? = nil) {
		kf.indicatorType = .activity
		
		kf.setImage(
			with: url,
			placeholder: placeHolder,
			options: getKingfisherOptionsInfo(),
			progressBlock: nil,
			completionHandler: { _ in }
		)
	}
	
	private func getKingfisherOptionsInfo() -> KingfisherOptionsInfo {
		return [
			.scaleFactor(UIScreen.main.scale),
			.transition(.fade(1)),
			.cacheOriginalImage,
		]
	}
}
