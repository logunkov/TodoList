//
//  LoginPresenterSpy.swift
//  TodoListTests
//
//  Created by Constantin on 27.03.2023.
//

@testable import TodoList

final class LoginPresenterSpy: ILoginPresenter {

	// MARK: - Internal Properties

	private(set) var isCalledPresent = false

	// MARK: - Internal Methods

	func present(response: LoginModels.Response) {
		isCalledPresent = true
	}
}
