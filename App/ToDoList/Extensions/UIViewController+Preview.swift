//
//  UIViewController+Preview.swift
//  TodoList
//
//  Created by Constantin on 12.04.2023.
//

import UIKit
import SwiftUI

extension UIViewController {
	struct Preview: UIViewControllerRepresentable {
		let viewController: UIViewController

		func makeUIViewController(context: Context) -> some UIViewController {
			viewController
		}

		func updateUIViewController(_ uiviewController: UIViewControllerType, context: Context) { }
	}

	func preview( ) -> some View {
		Preview(viewController: self)
	}
}
