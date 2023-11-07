//
//  ProductsListViewController.swift
//  SearchApp
//
//  Created by Diego Mazo on 4/11/23.
//

import UIKit
import Combine

class ProductsListViewController: UIViewController {
	private var presenter: ProductsListPresenter
	private var productsTableView: BaseTableViewController<ProductsListTableViewSectionModel, ProductsListTableViewCell>!
	
	public var customView: ProductsListViewType {
		view as! ProductsListViewType
	}
	
	override func loadView() {
		view = ProductsListView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		initializeViewElements()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.navigationController?.setNavigationBarHidden(true, animated: false)
	}
	
	public init(presenter: ProductsListPresenter) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
		
		// The view controller is assigned to the presenter
		self.presenter.view = self
		self.presenter.viewDidLoad()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func initializeViewElements() {
		productsTableView = BaseTableViewController(tableView: customView.productsTableView, sections: [])
		
		productsTableView.delegate = self
		customView.searchBar.delegate = self
	}
	
	private func transformData(_ data: [ProductListEntity]) -> [ProductsListTableViewCellModel] {
		return data.map {
			ProductsListTableViewCellModel(
				name: $0.title,
				price: $0.price,
				thumbnailLink: $0.thumbnailLink,
				currency: $0.currency,
				installments: $0.installments
			)
		}
	}
}

extension ProductsListViewController: ProductsListViewControllerType {
	func show(_ productViewStatus: ProductsViewStatus, products: [ProductListEntity]?) {
		switch productViewStatus {
			case .showProducts:
				guard let products = products else { return }
				
				productsTableView.sections = [
					ProductsListTableViewSectionModel(title: "", data: transformData(products))
				]
				
				customView.setupView(for: .showProducts)
			default:
				customView.setupView(for: productViewStatus)
		}
	}
}

extension ProductsListViewController: BaseTableViewControllerDelegate {
	func cellPressed(for position: Int) {
		presenter.openDetailProduct(for: position)
	}
}

extension ProductsListViewController: UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		searchBar.resignFirstResponder()
		guard let query = searchBar.text else { return }
		
		presenter.getProducts(for: query)
	}
	
	func position(for bar: UIBarPositioning) -> UIBarPosition {
		return .topAttached
	}
}
