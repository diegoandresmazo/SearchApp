//
//  ProductDetailView.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

import UIKit

final class ProductDetailView: UIView, ProductDetailViewType {
	private struct Constants {
		static let availableQuantityContainerHeight: CGFloat = 50
		static let conditionLabelSize: CGFloat = 14
		static let containerStackSpacing: CGFloat = 20
		static let imageHeight: CGFloat = 320
		static let installmentsLabelSize: CGFloat = 18
		static let priceLabelSize: CGFloat = 40
		static let separatorHeight: CGFloat = 10
		static let soldProductsLabelSize: CGFloat = 14
		static let titleLabelSize: CGFloat = 18
		
		static let containerStackBorderInsets = UIEdgeInsets(top: 16, left: 16, bottom: -16, right: -16)
	}
	
	private lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView(frame: .zero)
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		
		scrollView.showsVerticalScrollIndicator = false
		
		return scrollView
	}()
	
	private lazy var containerStackView: UIStackView = {
		let containerView = UIStackView(frame: .zero)
		containerView.translatesAutoresizingMaskIntoConstraints = false
		
		containerView.alignment = .fill
		containerView.axis = .vertical
		containerView.spacing = Constants.containerStackSpacing
		
		return containerView
	}()
	
	private lazy var conditionLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		label.font = Fonts.main.uiFont(withSize: Constants.conditionLabelSize)
		label.numberOfLines = 1
		label.textAlignment = .left
		label.textColor = Colors.mediumGray.uiColor
		
		return label
	}()
	
	private lazy var conditionSeparatorView: UIView = {
		let view = UIView(frame: .zero)
		view.translatesAutoresizingMaskIntoConstraints = false
		
		view.backgroundColor = Colors.mediumGray.uiColor
		view.isHidden = true
		
		return view
	}()
	
	private lazy var soldProductsLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		label.font = Fonts.main.uiFont(withSize: Constants.soldProductsLabelSize)
		label.numberOfLines = 1
		label.textColor = Colors.mediumGray.uiColor
		label.textAlignment = .left
		
		return label
	}()
	
	private lazy var titleLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		label.adjustsFontSizeToFitWidth = true
		label.font = Fonts.main.uiFont(withSize: Constants.titleLabelSize)
		label.minimumScaleFactor = 0.8
		label.numberOfLines = 3
		label.textAlignment = .left
		label.textColor = Colors.gray.uiColor
		
		return label
	}()
	
	private lazy var image: UIImageView = {
		let image = UIImageView(frame: .zero)
		image.translatesAutoresizingMaskIntoConstraints = false
		
		image.contentMode = .scaleAspectFit
		
		return image
	}()
	
	private lazy var priceLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		label.adjustsFontSizeToFitWidth = true
		label.font = Fonts.light.uiFont(withSize: Constants.priceLabelSize)
		label.minimumScaleFactor = 0.8
		label.numberOfLines = 1
		label.textAlignment = .left
		label.textColor = Colors.gray.uiColor
		
		return label
	}()
	
	private lazy var installmentsPriceLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		label.font = Fonts.light.uiFont(withSize: Constants.installmentsLabelSize)
		label.numberOfLines = 1
		label.textColor = Colors.green.uiColor
		
		return label
	}()
	
	private lazy var stockLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		label.font = Fonts.heavy.uiFont(withSize: Constants.installmentsLabelSize)
		label.numberOfLines = 1
		label.text = AppConstants.stockAvailableTitle
		label.textColor = Colors.gray.uiColor
		
		return label
	}()
	
	private lazy var availableQuantityContainer: UIView = {
		let view = UIView(frame: .zero)
		view.translatesAutoresizingMaskIntoConstraints = false
		
		view.backgroundColor = Colors.detailContainer.uiColor
		view.layer.cornerRadius = 4.0
		view.layer.masksToBounds = false
		
		return view
	}()
	
	private lazy var availableQuantityLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		label.backgroundColor = Colors.detailContainer.uiColor
		label.font = Fonts.main.uiFont(withSize: Constants.installmentsLabelSize)
		label.numberOfLines = 1
		label.textAlignment = .left
		label.textColor = Colors.gray.uiColor
		
		return label
	}()
	
	private lazy var sellerView = SellerView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		initialSetup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func initialSetup() {
		backgroundColor = .white
		
		addSubview(scrollView)
		scrollView.addSubview(containerStackView)
		
		let conditionInformationView = setupConditionInformation()
		let mainInformationView = setupMainInformation()
		let priceInformationView = setupPriceInformation()
		let stockInformationView = setupStockInformation()
		
		containerStackView.addArrangedSubview(conditionInformationView)
		containerStackView.setCustomSpacing(4, after: conditionInformationView)
		containerStackView.addArrangedSubview(mainInformationView)
		containerStackView.addArrangedSubview(priceInformationView)
		containerStackView.addArrangedSubview(stockInformationView)
		containerStackView.addArrangedSubview(sellerView)
		
		NSLayoutConstraint.activate([
			scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
			scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
			
			containerStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: Constants.containerStackBorderInsets.top),
			containerStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Constants.containerStackBorderInsets.left),
			containerStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Constants.containerStackBorderInsets.right),
			containerStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: Constants.containerStackBorderInsets.bottom)
		])
	}
	
	private func setupConditionInformation() -> UIView {
		let conditionContainer = UIView()
		conditionContainer.translatesAutoresizingMaskIntoConstraints = false
		
		conditionContainer.addSubview(conditionLabel)
		conditionContainer.addSubview(conditionSeparatorView)
		conditionContainer.addSubview(soldProductsLabel)
		
		NSLayoutConstraint.activate([
			conditionLabel.topAnchor.constraint(equalTo: conditionContainer.topAnchor),
			conditionLabel.leadingAnchor.constraint(equalTo: conditionContainer.leadingAnchor),
			conditionLabel.bottomAnchor.constraint(equalTo: conditionContainer.bottomAnchor),
			
			conditionSeparatorView.leadingAnchor.constraint(equalTo: conditionLabel.trailingAnchor, constant: 6),
			conditionSeparatorView.centerYAnchor.constraint(equalTo: conditionLabel.centerYAnchor),
			conditionSeparatorView.widthAnchor.constraint(equalToConstant: 1),
			conditionSeparatorView.heightAnchor.constraint(equalToConstant: Constants.separatorHeight),
			
			soldProductsLabel.topAnchor.constraint(equalTo: conditionLabel.topAnchor),
			soldProductsLabel.leadingAnchor.constraint(equalTo: conditionSeparatorView.trailingAnchor, constant: 6),
			soldProductsLabel.trailingAnchor.constraint(lessThanOrEqualTo: conditionContainer.trailingAnchor),
			soldProductsLabel.bottomAnchor.constraint(equalTo: conditionLabel.bottomAnchor)
		])
		
		return conditionContainer
	}
	
	private func setupMainInformation() -> UIView {
		let mainInformationContainer = UIView()
		mainInformationContainer.translatesAutoresizingMaskIntoConstraints = false
		
		mainInformationContainer.addSubview(image)
		mainInformationContainer.addSubview(titleLabel)
		
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: mainInformationContainer.topAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: mainInformationContainer.leadingAnchor),
			titleLabel.trailingAnchor.constraint(equalTo: mainInformationContainer.trailingAnchor),
			
			image.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
			image.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			image.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
			image.heightAnchor.constraint(equalToConstant: Constants.imageHeight),
			image.bottomAnchor.constraint(equalTo: mainInformationContainer.bottomAnchor)
		])
		
		return mainInformationContainer
	}
	
	private func setupPriceInformation() -> UIView {
		let priceInformationContainer = UIView()
		priceInformationContainer.translatesAutoresizingMaskIntoConstraints = false
		
		priceInformationContainer.addSubview(installmentsPriceLabel)
		priceInformationContainer.addSubview(priceLabel)
		
		NSLayoutConstraint.activate([
			priceLabel.topAnchor.constraint(equalTo: priceInformationContainer.topAnchor),
			priceLabel.leadingAnchor.constraint(equalTo: priceInformationContainer.leadingAnchor),
			priceLabel.trailingAnchor.constraint(equalTo: priceInformationContainer.trailingAnchor),
			
			installmentsPriceLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor),
			installmentsPriceLabel.leadingAnchor.constraint(equalTo: priceInformationContainer.leadingAnchor),
			installmentsPriceLabel.trailingAnchor.constraint(equalTo: priceInformationContainer.trailingAnchor),
			installmentsPriceLabel.bottomAnchor.constraint(equalTo: priceInformationContainer.bottomAnchor)
		])
		
		return priceInformationContainer
	}
	
	private func setupStockInformation() -> UIView {
		let stockInformationContainer = UIView()
		stockInformationContainer.translatesAutoresizingMaskIntoConstraints = false
		
		stockInformationContainer.addSubview(availableQuantityContainer)
		availableQuantityContainer.addSubview(availableQuantityLabel)
		stockInformationContainer.addSubview(stockLabel)
		
		NSLayoutConstraint.activate([
			stockLabel.topAnchor.constraint(equalTo: stockInformationContainer.topAnchor),
			stockLabel.leadingAnchor.constraint(equalTo: stockInformationContainer.leadingAnchor),
			stockLabel.trailingAnchor.constraint(equalTo: stockInformationContainer.trailingAnchor),
			
			availableQuantityContainer.topAnchor.constraint(equalTo: stockLabel.bottomAnchor, constant: 12),
			availableQuantityContainer.leadingAnchor.constraint(equalTo: stockInformationContainer.leadingAnchor),
			availableQuantityContainer.trailingAnchor.constraint(equalTo: stockInformationContainer.trailingAnchor),
			availableQuantityContainer.heightAnchor.constraint(equalToConstant: Constants.availableQuantityContainerHeight),
			availableQuantityContainer.bottomAnchor.constraint(equalTo: stockInformationContainer.bottomAnchor),
			
			availableQuantityLabel.leadingAnchor.constraint(equalTo: availableQuantityContainer.leadingAnchor, constant: 12),
			availableQuantityLabel.trailingAnchor.constraint(equalTo: availableQuantityContainer.trailingAnchor, constant: -12),
			availableQuantityLabel.centerYAnchor.constraint(equalTo: availableQuantityContainer.centerYAnchor)
		])
		
		return stockInformationContainer
	}
	
	func showErrorRetrievingDetailInfo(for product: ProductListEntity) {
		image.setImageFromURL(URL(string: product.thumbnailLink))
		
		sellerView.showErrorRetrievingDetailInfo()
	}
	
	func configureView(with product: ProductListEntity) {
		guard let currency = product.currency else { return }
		
		sellerView.showLoadingSeller()
		
		let numberFormatter: NumberFormatter = .numberFormatter(for: currency)
		
		conditionLabel.text = product.condition
		titleLabel.text = product.title
		priceLabel.text = numberFormatter.string(for: product.price)
		
		setupAvailableQuantityLabel(for: product.availableQuantity)
		setupSoldQuantityLabel(for: product.soldQuantity)
		
		guard let productInfo = product.detailInfo,
			  let seller = productInfo.seller else {
			return
		}
		
		image.setImageFromURL(URL(string: productInfo.imageLink))
		
		sellerView.stopLoadingSeller()
		setupSellerInfo(for: seller)
		
		guard let installments = product.installments,
			  let amountString = numberFormatter.string(for: installments.amount)
		else {
			return
		}
		
		installmentsPriceLabel.text = "\(installments.quantity)x \(amountString)"
	}
	
	private func setupSoldQuantityLabel(for quantity: Int) {
		if quantity != 0 {
			conditionSeparatorView.isHidden = false
			
			let quantityString = String (quantity)
			let soldString = quantity > 1 ? AppConstants.productsSoldText : AppConstants.productSoldText
			
			soldProductsLabel.text = "\(quantityString) \(soldString)"
		}
	}
	
	private func setupAvailableQuantityLabel(for quantity: Int) {
		if quantity != 0 {
			let quantityString = String (quantity)
			let availableString = quantity > 1 ? AppConstants.productsAvailableText : AppConstants.productAvailableText
			
			availableQuantityLabel.text = "\(quantityString) \(availableString)"
		}
	}
	
	private func setupSellerInfo(for seller: SellerEntity) {
		sellerView.setupSellerInfo(for: seller)
	}
}
