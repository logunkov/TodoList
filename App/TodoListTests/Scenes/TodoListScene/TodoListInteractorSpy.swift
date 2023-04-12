//
//  TodoListInteractorSpy.swift
//  TodoListTests
//
//  Created by Constantin on 12.04.2023.
//

@testable import TodoList

final class TodoListInteractorSpy: ITodoListInteractor {

	// MARK: - Internal Properties

	private(set) var isFetchDataCalled = false
	private(set) var isDidTaskSelectedCalled = false

	// MARK: - Internal Methods

	func fetchData() {
		isFetchDataCalled = true
	}

	func didTaskSelected(atIndex: TodoListModel.Request.TaskSelected) {
		isDidTaskSelectedCalled = true
	}
}
