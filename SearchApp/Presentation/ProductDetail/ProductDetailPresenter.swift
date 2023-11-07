//
//  ProductDetailPresenter.swift
//  SearchApp
//
//  Created by Diego Mazo on 5/11/23.
//

import Combine
import OSLog

final class ProductDetailPresenter {
	weak var view: ProductDetailViewControllerType?
	
	var product: ProductListEntity
	private var navigator: NavigatorType
	private var productDetailService: ProductDetailServiceType
	
	private var cancellable: Set<AnyCancellable> = Set<AnyCancellable>()
	
	init(
		product: ProductListEntity,
		productDetailService: ProductDetailServiceType,
		navigator: NavigatorType
	) {
		self.product = product
		self.productDetailService = productDetailService
		self.navigator = navigator
	}
	
	func viewDidLoad() {
		self.view?.showProduct(product)
		
		getProductDetail(for: product.id)
	}
}

extension ProductDetailPresenter: ProductDetailPresenterType {
	func getProductDetail(for productId: String) {
		productDetailService.getProductDetailInfo(for: productId)
			.sink { [weak self] errorCompletion in
				guard let self = self else { return }
				
				if case .failure(let err) = errorCompletion {
					Logger.api.error("API related error: \(err.errorDescription)")
					
					self.view?.showErrorRetrievingDetailInfo(for: self.product)
				}
			} receiveValue: { [weak self] productWithInfo in
				guard let self = self else { return }
				
				self.product.detailInfo = productWithInfo
				self.view?.showProduct(self.product)
			}
			.store(in: &cancellable)
	}
}
