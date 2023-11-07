//
//  ProductDetailContract.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

import UIKit

protocol ProductDetailViewControllerType: AnyObject {
	func showProduct(_ product: ProductListEntity)
	func showErrorRetrievingDetailInfo(for product: ProductListEntity)
}

protocol ProductDetailPresenterType: AnyObject {
	func getProductDetail(for productId: String)
}

protocol ProductDetailViewType: UIView {
	func configureView(with product: ProductListEntity)
	func showErrorRetrievingDetailInfo(for product: ProductListEntity)
}
