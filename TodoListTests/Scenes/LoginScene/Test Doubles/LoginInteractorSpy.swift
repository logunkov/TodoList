//
//  LoginInteractorSpy.swift
//  TodoListTests
//
//  Created by Constantin on 27.03.2023.
//

@testable import TodoList

class LoginInteractorSpy: ILoginInteractor {

	// MARK: - Internal Properties
	private(set) var isCalledLogin = false

	// MARK: - Internal Methods
	func login(request: LoginModels.Request) {
		isCalledLogin = true
	}
}
