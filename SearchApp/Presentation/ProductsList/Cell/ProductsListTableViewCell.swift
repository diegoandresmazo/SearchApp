//
//  ProductsListTableViewCell.swift
//  SearchApp
//
//  Created by Diego Mazo on 4/11/23.
//

import UIKit

final class ProductsListTableViewCell: UITableViewCell, ConfigurableCell {
	private struct Constants {
		static let installmentsLabelSize: CGFloat = 14
		static let priceLabelSize: CGFloat = 20
		static let separatorHeight: CGFloat = 1
		static let titleLabelSize: CGFloat = 16
		
		static let imageSize = CGSize(width: 120, height: 120)
		static let favoriteIconSize = CGSize(width: 20, height: 20)
		
		static let contentBorderInsets = UIEdgeInsets(top: 20, left: 12, bottom: -20, right: -12)
	}
	
	private lazy var image: UIImageView = {
		let image = UIImageView(frame: .zero)
		image.translatesAutoresizingMaskIntoConstraints = false
		
		image.contentMode = .scaleAspectFit
		
		return image
	}()
	
	private lazy var titleLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		label.adjustsFontSizeToFitWidth = true
		label.font = Fonts.light.uiFont(withSize: Constants.titleLabelSize)
		label.minimumScaleFactor = 0.8
		label.numberOfLines = 3
		label.textColor = .black
		
		return label
	}()
	
	private lazy var priceLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		label.font = Fonts.main.uiFont(withSize: Constants.priceLabelSize)
		label.numberOfLines = 1
		label.textColor = .black
		
		return label
	}()
		
	private lazy var installmentsPriceLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		label.font = Fonts.main.uiFont(withSize: Constants.installmentsLabelSize)
		label.numberOfLines = 1
		label.textColor = Colors.green.uiColor
		
		return label
	}()
	
	private lazy var favoriteIcon: UIImageView = {
		let icon = UIImageView(frame: .zero)
		icon.translatesAutoresizingMaskIntoConstraints = false
		
		icon.contentMode = .scaleAspectFit
		icon.image = Icons.heart.uiImage
		icon.tintColor = Colors.blue.uiColor
		
		return icon
	}()
	
	private lazy var separator: UIView = {
		let view = UIView(frame: .zero)
		view.translatesAutoresizingMaskIntoConstraints = false
		
		view.backgroundColor = Colors.lightGray.uiColor
		
		return view
	}()
	
	public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		selectionStyle = .none
		
		contentView.addSubview(favoriteIcon)
		contentView.addSubview(image)
		contentView.addSubview(installmentsPriceLabel)
		contentView.addSubview(priceLabel)
		contentView.addSubview(separator)
		contentView.addSubview(titleLabel)
		
		NSLayoutConstraint.activate([
			separator.topAnchor.constraint(equalTo: contentView.topAnchor),
			separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			separator.heightAnchor.constraint(equalToConstant: Constants.separatorHeight),
			
			image.topAnchor.constraint(equalTo: separator.topAnchor, constant: Constants.contentBorderInsets.top),
			image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.contentBorderInsets.left),
			image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.contentBorderInsets.bottom),
			image.heightAnchor.constraint(equalToConstant: Constants.imageSize.height),
			image.widthAnchor.constraint(equalToConstant: Constants.imageSize.width),
			
			titleLabel.topAnchor.constraint(equalTo: image.topAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
			titleLabel.trailingAnchor.constraint(equalTo: favoriteIcon.leadingAnchor, constant: -16),
			
			favoriteIcon.topAnchor.constraint(equalTo: image.topAnchor),
			favoriteIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.contentBorderInsets.right),
			favoriteIcon.heightAnchor.constraint(equalToConstant: Constants.favoriteIconSize.height),
			favoriteIcon.widthAnchor.constraint(equalToConstant: Constants.favoriteIconSize.width),
			
			priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
			priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			priceLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
			
			installmentsPriceLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor),
			installmentsPriceLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
			installmentsPriceLabel.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor)
		])
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(with data: Any) {
		guard let data = data as? ProductsListTableViewCellModel else { return }
		
		titleLabel.text = data.name
		image.setImageFromURL(URL(string: data.thumbnailLink))
		
		setupPriceLabel(for: data)
		setupInstallmentsLabel(for: data)
	}
	
	private func setupPriceLabel(for data: ProductsListTableViewCellModel) {
		guard let currency = data.currency else {
			return
		}
		
		let numberFormatter: NumberFormatter = .numberFormatter(for: currency)
		priceLabel.text = numberFormatter.string(for: data.price)
	}
	
	private func setupInstallmentsLabel(for data: ProductsListTableViewCellModel) {
		guard let currency = data.currency else {
			return
		}
		
		let numberFormatter: NumberFormatter = .numberFormatter(for: currency)
		
		guard let installments = data.installments,
			  let amountString = numberFormatter.string(for: installments.amount) else {
			installmentsPriceLabel.text = ""
			
			return
		}
		
		installmentsPriceLabel.text = "\(installments.quantity)x \(amountString)"
	}
}
