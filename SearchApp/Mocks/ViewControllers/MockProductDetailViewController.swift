//
//  MockProductDetailViewController.swift
//  SearchApp
//
//  Created by Diego Mazo on 7/11/23.
//

import Foundation

final class MockProductDetailViewController: ProductDetailViewControllerType {
	func showProduct(_ product: ProductListEntity) {}
	
	func showErrorRetrievingDetailInfo(for product: ProductListEntity) {}
}
