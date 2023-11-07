//
//  ProductDetailViewController.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

import UIKit
import Combine

class ProductDetailViewController: UIViewController {
	private var presenter: ProductDetailPresenter
	
	public var customView: ProductDetailViewType {
		view as! ProductDetailViewType
	}
	
	override func loadView() {
		view = ProductDetailView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		initializeViewElements()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
	}
	
	public init(presenter: ProductDetailPresenter) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
		
		// The view controller is assigned to the presenter
		self.presenter.view = self
		self.presenter.viewDidLoad()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func initializeViewElements() {}
}

extension ProductDetailViewController: ProductDetailViewControllerType {
	func showProduct(_ product: ProductListEntity) {
		customView.configureView(with: product)
	}
	
	func showErrorRetrievingDetailInfo(for product: ProductListEntity) {
		customView.showErrorRetrievingDetailInfo(for: product)
	}
}
