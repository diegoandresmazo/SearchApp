//
//  ProductsListView.swift
//  SearchApp
//
//  Created by Diego Mazo on 4/11/23.
//

import UIKit

enum ProductsViewStatus {
	case showError
	case showLoadingSearch
	case showNotResults
	case showProducts
}

final class ProductsListView: UIView, ProductsListViewType {
	private struct Constants {
		static let notResultsMessageLabelSize: CGFloat = 16
		static let notResultsTitleLabelSize: CGFloat = 22
		
		static let notResultsIconSize = CGSize(width: 100, height: 100)
	}
	
	lazy var searchBar: UISearchBar = {
		var searchBar = UISearchBar(frame: .zero)
		searchBar.translatesAutoresizingMaskIntoConstraints = false
		
		searchBar.barTintColor = Colors.main.uiColor
		searchBar.placeholder = AppConstants.searchBarPlaceholder
		searchBar.searchTextField.backgroundColor = .white
		
		return searchBar
	}()
	
	lazy var productsTableView: UITableView = {
		var table = UITableView(frame: .zero)
		table.translatesAutoresizingMaskIntoConstraints = false
		
		table.backgroundColor = Colors.background.uiColor
		table.rowHeight = UITableView.automaticDimension
		table.separatorStyle = .none
		table.showsVerticalScrollIndicator = false
		
		return table
	}()
	
	private lazy var informationStack: UIStackView = {
		let stackView = UIStackView(frame: .zero)
		stackView.translatesAutoresizingMaskIntoConstraints = false
		
		stackView.alignment = .fill
		stackView.axis = .vertical
		stackView.distribution = .fill
		stackView.isHidden = true
		stackView.spacing = 5
		
		return stackView
	}()
	
	private lazy var informationIconContainer: UIView = {
		let view = UIView(frame: .zero)
		view.translatesAutoresizingMaskIntoConstraints = false
		
		return view
	}()
	
	private lazy var informationIcon: UIImageView = {
		let icon = UIImageView(frame: .zero)
		icon.translatesAutoresizingMaskIntoConstraints = false
		
		icon.contentMode = .scaleAspectFit
		icon.image = Icons.search.uiImage
		icon.tintColor = Colors.lightGray.uiColor
		
		return icon
	}()
	
	private lazy var informationTitleLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		label.adjustsFontSizeToFitWidth = true
		label.font = Fonts.light.uiFont(withSize: Constants.notResultsTitleLabelSize)
		label.minimumScaleFactor = 0.8
		label.numberOfLines = 1
		label.textAlignment = .center
		label.textColor = .black
		
		return label
	}()
	
	private lazy var informationMessageLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		label.font = Fonts.main.uiFont(withSize: Constants.notResultsMessageLabelSize)
		label.numberOfLines = 3
		label.sizeToFit()
		label.textColor = Colors.gray.uiColor
		label.textAlignment = .center
		
		return label
	}()
	
	private lazy var spinner: UIActivityIndicatorView = {
		let spinner = UIActivityIndicatorView(frame: .zero)
		spinner.translatesAutoresizingMaskIntoConstraints = false
		
		spinner.color = Colors.blue.uiColor
		spinner.hidesWhenStopped = true
		spinner.style = .large
		
		return spinner
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		initialSetup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func initialSetup() {
		backgroundColor = Colors.background.uiColor
		
		addSubview(productsTableView)
		addSubview(searchBar)
		addSubview(spinner)
		
		NSLayoutConstraint.activate([
			searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
			searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
			searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			
			productsTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
			productsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
			productsTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
			productsTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
			
			spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
			spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
		])
		
		setupNotResultsStack()
	}
	
	private func setupNotResultsStack() {
		addSubview(informationStack)
		
		informationStack.addArrangedSubview(informationIconContainer)
		informationStack.setCustomSpacing(20, after: informationIconContainer)
		informationStack.addArrangedSubview(informationTitleLabel)
		informationStack.addArrangedSubview(informationMessageLabel)
		informationIconContainer.addSubview(informationIcon)
		
		NSLayoutConstraint.activate([
			informationStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
			informationStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
			informationStack.centerYAnchor.constraint(equalTo: centerYAnchor),
			
			informationIcon.topAnchor.constraint(equalTo: informationIconContainer.topAnchor),
			informationIcon.centerXAnchor.constraint(equalTo: informationIconContainer.centerXAnchor),
			informationIcon.bottomAnchor.constraint(equalTo: informationIconContainer.bottomAnchor),
			informationIcon.heightAnchor.constraint(equalToConstant: Constants.notResultsIconSize.height),
			informationIcon.widthAnchor.constraint(equalToConstant: Constants.notResultsIconSize.width),
		])
	}
	
	func setupView(for status: ProductsViewStatus) {
		switch status {
			case .showLoadingSearch:
				productsTableView.isHidden = true
				informationStack.isHidden = true
				
				spinner.startAnimating()
				
			case .showProducts:
				productsTableView.isHidden = false
				informationStack.isHidden = true
				
				spinner.stopAnimating()
				
			case .showNotResults:
				productsTableView.isHidden = true
				informationStack.isHidden = false
				
				setupInformation(for: .showNotResults)
				spinner.stopAnimating()
				
			case .showError:
				productsTableView.isHidden = true
				informationStack.isHidden = false
				
				setupInformation(for: .showError)
				spinner.stopAnimating()
		}
	}
	
	private func setupInformation(for status: ProductsViewStatus) {
		if status == .showNotResults {
			informationTitleLabel.text = AppConstants.searchProductsNotResultsInformationTitle
			informationMessageLabel.text = AppConstants.searchProductsNotResultsInformationMessage
			
			informationIcon.image = Icons.search.uiImage
		} else if status == .showError {
			informationTitleLabel.text = AppConstants.searchProductsErrorInformationTitle
			informationMessageLabel.text = AppConstants.searchProductsErrorInformationMessage
			
			informationIcon.image = Icons.error.uiImage
		}
	}
}
