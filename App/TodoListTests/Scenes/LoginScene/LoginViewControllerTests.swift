//
//  LoginViewControllerTests.swift
//  TodoListTests
//
//  Created by Constantin on 27.03.2023.
//

import XCTest
@testable import TodoList

final class LoginViewControllerTests: XCTestCase {

	// MARK: - Private Properties

	private var interactor: LoginInteractorSpy! // swiftlint:disable:this implicitly_unwrapped_optional

	// MARK: - Public Methods

	func test_render_withValidRequest_shouldLoggedIn() {
		let sut = makeSut()
		sut.login()

		XCTAssertTrue(interactor.isCalledLogin, "Не вызван interactor.login(:)")
	}
}

// MARK: - Private Methods

private extension LoginViewControllerTests {
	func makeSut() -> LoginViewController {
		let mainView = LoginViewSpy()
		let viewController = LoginViewController(mainView: mainView)
		interactor = LoginInteractorSpy()
		viewController.interactor = interactor
		return viewController
	}
}
