//
//  TodoListTableViewSpy.swift
//  TodoListTests
//
//  Created by Constantin on 12.04.2023.
//

import XCTest

final class TodoListTableViewSpy: UITableView {

	// MARK: - Internal Properties

	private(set) var isCalledReloadData = false

	// MARK: - Internal Methods

	override func reloadData() {
		super.reloadData()
		isCalledReloadData = true
	}
}
