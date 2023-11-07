//
//  ProductsListPresenterTests.swift
//  SearchAppTests
//
//  Created by Diego Mazo on 7/11/23.
//

import XCTest
@testable import SearchApp

final class ProductsListPresenterTests: XCTestCase {
	var presenter: ProductsListPresenter!
	
	var mockView: MockProductsListViewController!
	var navigator: MockNavigator!
	var productsListService: MockProductsListService!
	
	override func setUp() {
		super.setUp()
		
		mockView = MockProductsListViewController()
		navigator = MockNavigator()
		productsListService = MockProductsListService()
		
		presenter = ProductsListPresenter(productsListService: productsListService, navigator: navigator)
		presenter.view = mockView
	}
	
	override func tearDown() {
		presenter = nil
		
		mockView = nil
		navigator = nil
		productsListService = nil
	}
	
	func testGetProducts() {
		presenter.getProducts(for: "query")
		
		XCTAssertEqual(mockView.viewStatus, .showProducts)
	}
	
	func testGetProductsEmpty() {
		presenter.getProducts(for: "emptyQuery")
		
		XCTAssertEqual(mockView.viewStatus, .showNotResults)
	}
	
	func testGetProductsError() {
		presenter.getProducts(for: "errorQuery")
		
		XCTAssertEqual(mockView.viewStatus, .showError)
	}
}
