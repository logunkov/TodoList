//
//  LoginPresenterTests.swift
//  TodoListTests
//
//  Created by Constantin on 27.03.2023.
//

import XCTest
@testable import TodoList

final class LoginPresenterTests: XCTestCase {

	// MARK: - Private Properties

	private let viewController = LoginViewControllerSpy()

	// MARK: - Internal Methods

	func test_present_withValidRequest_shouldBeRenderSuccess() {
		let sut = makeSut()
		let response = LoginModels.Response(success: true)

		sut.present(response: response)

		XCTAssertTrue(viewController.isCalledRender, "Не вызван viewController.render(:)")
		XCTAssertTrue(viewController.viewModel, "Ошибка в модели данных")
	}

	func test_present_withFailRequest_shouldBeRenderFailure() {
		let sut = makeSut()
		let response = LoginModels.Response(success: false)

		sut.present(response: response)

		XCTAssertTrue(viewController.isCalledRender, "Не вызван viewController.render(:)")
		XCTAssertFalse(viewController.viewModel, "Ошибка в модели данных")
	}
}

// MARK: - Private extension

private extension LoginPresenterTests {
	func makeSut() -> LoginPresenter {
		LoginPresenter(viewController: viewController)
	}
}
