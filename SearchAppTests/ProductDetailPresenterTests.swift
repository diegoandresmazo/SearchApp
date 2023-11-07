//
//  ProductDetailPresenterTests.swift
//  SearchAppTests
//
//  Created by Diego Mazo on 7/11/23.
//

import XCTest
@testable import SearchApp

final class ProductDetailPresenterTests: XCTestCase {
	var presenter: ProductDetailPresenter!
	
	var mockView: MockProductDetailViewController!
	var navigator: MockNavigator!
	var productDetailService: MockProductDetailService!
	
	var product: ProductListEntity!
	
	override func setUp() {
		super.setUp()
		
		mockView = MockProductDetailViewController()
		navigator = MockNavigator()
		productDetailService = MockProductDetailService()
		
		product = MockProductDetailEntity.getProdutWithoutDetailInfo()
		
		presenter = ProductDetailPresenter(product: product, productDetailService: productDetailService, navigator: navigator)
		presenter.view = mockView
	}
	
	override func tearDown() {
		presenter = nil
		
		mockView = nil
		navigator = nil
		productDetailService = nil
		
		product = nil
	}
	
	func testGetProductDetail() {
		let productDetail = MockProductDetailEntity.getProductDetailEntity()
		presenter.getProductDetail(for: "someProductId")
		
		XCTAssertEqual(presenter.product.detailInfo, productDetail)
	}
}
