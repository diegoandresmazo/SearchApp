//
//  UINavigationController+Extension.swift
//  SearchApp
//
//  Created by Diego Mazo on 4/11/23.
//

import UIKit

extension UINavigationController: UINavigationControllerDelegate {
	open override func viewDidLoad() {
		super.viewDidLoad()
		
		self.delegate = self
	}
	
	open override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		setNeedsStatusBarAppearanceUpdate()
	}
	
	open override var preferredStatusBarStyle: UIStatusBarStyle {
		.darkContent
	}
	
	public func navigationController(
		_ navigationController: UINavigationController,
		willShow viewController: UIViewController,
		animated: Bool
	) {
		let item = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
		
		item.tintColor = Colors.gray.uiColor
		viewController.navigationItem.backBarButtonItem = item
		
		navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
		navigationController.navigationBar.backgroundColor = Colors.main.uiColor
		navigationController.navigationBar.shadowImage = UIImage()
		
		navigationController.navigationBar.layoutIfNeeded()
	}
}
