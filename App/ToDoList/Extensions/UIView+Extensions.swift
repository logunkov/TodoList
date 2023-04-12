//
//  UIView+Extensions.swift
//  TodoList
//
//  Created by Constantin on 12.04.2023.
//

import UIKit

extension UIView {
	/// Добавляет на view массив subviews
	/// - Parameter views: массив subviews, которые необходимо добавить на view
	func addSubviews(_ views: [UIView]) {
		views.forEach { addSubview($0) }
	}
}
