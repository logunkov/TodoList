//
//  TodoListPresenterSpy.swift
//  TodoListTests
//
//  Created by Constantin on 12.04.2023.
//

@testable import TodoList

class TodoListPresenterSpy: ITodoListPresenter {

	// MARK: - Internal Properties

	private(set) var isCalledPresent = false
	private(set) var response = TodoListModel.Response(data: [])

	// MARK: - Internal Methods

	func present(response: TodoListModel.Response) {
		isCalledPresent = true
		self.response = response
	}
}
