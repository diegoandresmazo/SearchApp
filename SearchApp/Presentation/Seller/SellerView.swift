//
//  SellerView.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

import Foundation
import UIKit

final class SellerView: UIView {
	private struct Constants {
		static let labelsSize: CGFloat = 18
	}
	
	private lazy var sellerLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		label.adjustsFontSizeToFitWidth = true
		label.font = Fonts.heavy.uiFont(withSize: Constants.labelsSize)
		label.numberOfLines = 1
		label.minimumScaleFactor = 0.7
		label.text = AppConstants.sellerLabelText
		label.textColor = Colors.gray.uiColor
		
		return label
	}()
	
	private lazy var sellerContainer: UIView = {
		let containerView = UIView(frame: .zero)
		containerView.translatesAutoresizingMaskIntoConstraints = false
		
		containerView.backgroundColor = Colors.detailContainer.uiColor
		containerView.isHidden = true
		containerView.layer.cornerRadius = 4.0
		containerView.layer.masksToBounds = false
		
		return containerView
	}()
	
	private lazy var sellerSpinner: UIActivityIndicatorView = {
		let spinner = UIActivityIndicatorView(frame: .zero)
		spinner.translatesAutoresizingMaskIntoConstraints = false
		
		spinner.color = Colors.blue.uiColor
		spinner.hidesWhenStopped = true
		spinner.style = .large
		
		return spinner
	}()
	
	private lazy var sellerErrorContainer: UIView = {
		let view = UIView(frame: .zero)
		view.translatesAutoresizingMaskIntoConstraints = false
		
		view.backgroundColor = Colors.detailContainer.uiColor
		view.isHidden = true
		view.layer.cornerRadius = 4.0
		view.layer.masksToBounds = false
		
		return view
	}()
	
	private lazy var sellerErrorLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		label.adjustsFontSizeToFitWidth = true
		label.font = Fonts.main.uiFont(withSize: Constants.labelsSize)
		label.numberOfLines = 2
		label.minimumScaleFactor = 0.8
		label.text = AppConstants.sellerLabelErrorText
		label.textAlignment = .center
		label.textColor = Colors.gray.uiColor
		
		return label
	}()
	
	private lazy var sellerNickname: UILabel = {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		label.adjustsFontSizeToFitWidth = true
		label.font = Fonts.main.uiFont(withSize: Constants.labelsSize)
		label.numberOfLines = 1
		label.minimumScaleFactor = 0.8
		label.textAlignment = .left
		label.textColor = Colors.gray.uiColor
		
		return label
	}()
	
	private lazy var sellerAddressTitle: UILabel = {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		label.font = Fonts.heavy.uiFont(withSize: Constants.labelsSize)
		label.numberOfLines = 1
		label.text = AppConstants.cityLabelText
		label.textColor = Colors.gray.uiColor
		label.textAlignment = .left
		
		return label
	}()
	
	private lazy var sellerAddress: UILabel = {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		label.adjustsFontSizeToFitWidth = true
		label.font = Fonts.main.uiFont(withSize: Constants.labelsSize)
		label.numberOfLines = 1
		label.minimumScaleFactor = 0.8
		label.textAlignment = .left
		label.textColor = Colors.gray.uiColor
		
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		initialSetup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func initialSetup() {
		addSubview(sellerContainer)
		addSubview(sellerErrorContainer)
		addSubview(sellerLabel)
		addSubview(sellerSpinner)
		
		sellerErrorContainer.addSubview(sellerErrorLabel)
		sellerContainer.addSubview(sellerAddress)
		sellerContainer.addSubview(sellerAddressTitle)
		sellerContainer.addSubview(sellerNickname)
		
		NSLayoutConstraint.activate([
			sellerLabel.topAnchor.constraint(equalTo: topAnchor),
			sellerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
			sellerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
			
			sellerSpinner.centerXAnchor.constraint(equalTo: sellerContainer.centerXAnchor),
			sellerSpinner.centerYAnchor.constraint(equalTo: sellerContainer.centerYAnchor),
			
			sellerContainer.topAnchor.constraint(equalTo: sellerLabel.bottomAnchor, constant: 12),
			sellerContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
			sellerContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
			sellerContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
			
			sellerErrorContainer.topAnchor.constraint(equalTo: sellerLabel.bottomAnchor, constant: 12),
			sellerErrorContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
			sellerErrorContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
			sellerErrorContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
			
			sellerErrorLabel.topAnchor.constraint(equalTo: sellerErrorContainer.topAnchor, constant: 12),
			sellerErrorLabel.leadingAnchor.constraint(equalTo: sellerErrorContainer.leadingAnchor, constant: 12),
			sellerErrorLabel.trailingAnchor.constraint(equalTo: sellerErrorContainer.trailingAnchor, constant: -12),
			sellerErrorLabel.bottomAnchor.constraint(equalTo: sellerErrorContainer.bottomAnchor, constant: -12),
			
			sellerNickname.topAnchor.constraint(equalTo: sellerContainer.topAnchor, constant: 12),
			sellerNickname.leadingAnchor.constraint(equalTo: sellerContainer.leadingAnchor, constant: 12),
			sellerNickname.trailingAnchor.constraint(equalTo: sellerContainer.trailingAnchor, constant: -12),
			
			sellerAddressTitle.topAnchor.constraint(equalTo: sellerNickname.bottomAnchor, constant: 12),
			sellerAddressTitle.leadingAnchor.constraint(equalTo: sellerContainer.leadingAnchor, constant: 12),
			sellerAddressTitle.bottomAnchor.constraint(equalTo: sellerContainer.bottomAnchor, constant: -12),
			
			sellerAddress.topAnchor.constraint(equalTo: sellerAddressTitle.topAnchor),
			sellerAddress.leadingAnchor.constraint(equalTo: sellerAddressTitle.trailingAnchor, constant: 6),
			sellerAddress.trailingAnchor.constraint(lessThanOrEqualTo: sellerContainer.trailingAnchor, constant: -6),
			sellerAddress.bottomAnchor.constraint(equalTo: sellerAddressTitle.bottomAnchor),
		])
	}
	
	func showErrorRetrievingDetailInfo() {
		sellerSpinner.stopAnimating()
		
		sellerErrorContainer.isHidden = false
	}
	
	func showLoadingSeller() {
		sellerSpinner.startAnimating()
	}
	
	func stopLoadingSeller() {
		sellerSpinner.stopAnimating()
	}
	
	func setupSellerInfo(for seller: SellerEntity) {
		sellerAddress.text = seller.addressCity
		sellerNickname.text = seller.nickname
		
		sellerContainer.isHidden = false
	}
}
