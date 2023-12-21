//
//  AccessibilityIdentifier.swift
//  TodoList
//
//  Created by Constantin on 21.12.2023.
//

import Foundation

enum AccessibilityIdentifier {

	enum LoginScene {
		static let textFieldLogin = "textFieldLogin"
		static let textFieldPass = "textFieldPass"
		static let buttonLogin = "buttonLogin"
	}

	enum TodoListScene {
		static let tableView = "tableView"
		static let title = "todoList"
		static let cell = "cell-%d-%d"
	}
}
