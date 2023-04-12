//
//  TodoListViewControllerSpy.swift
//  TodoListTests
//
//  Created by Constantin on 12.04.2023.
//

@testable import TodoList

class TodoListViewControllerSpy: ITodoListViewController {

	// MARK: - Internal Properties

	private(set) var isCalledRender = false
	private(set) var viewModel = TodoListModel.ViewModel(tasksBySections: [])

	// MARK: - Internal Methods

	func render(viewModel: TodoListModel.ViewModel) {
		isCalledRender = true
		self.viewModel = viewModel
	}
}
