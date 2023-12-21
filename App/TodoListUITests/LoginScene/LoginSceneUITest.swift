//
//  LoginSceneUITest.swift
//  TodoListUITests
//
//  Created by Constantin on 21.12.2023.
//

import XCTest

final class LoginSceneUITest: XCTestCase {

	// MARK: - Private properties

	private var app: XCUIApplication! // swiftlint:disable:this implicitly_unwrapped_optional

	// MARK: - Lifecycle

	override func setUp() {
		super.setUp()

		app = XCUIApplication()
		app.launch()
	}

	override func tearDown() {
		app = nil

		super.tearDown()
	}

	// MARK: - Internal Methods

	func test_login_withValid_shouldBeSuccess() {
		let sut = makeSut()

		sut.isLoginScreen()
			.set(login: MockLoginWorkerResults.Valid.login)
			.set(password: MockLoginWorkerResults.Valid.pass)
			.login()

		XCTAssertFalse(sut.getAlert().exists, "Появилось уведомление об ошибочной авторизации")
	}

	func test_login_withInvalid_shouldBeFailure() {
		let sut = makeSut()

		sut.isLoginScreen()
			.set(login: MockLoginWorkerResults.Invalid.login)
			.set(password: MockLoginWorkerResults.Invalid.pass)
			.login()

		XCTAssertTrue(sut.getAlert().exists, "Уведомление об ошибочной авторизации не появилось")
	}
}

// MARK: - Private methods

private extension LoginSceneUITest {
	func makeSut() -> LoginScreenObject {
		LoginScreenObject(app: app)
	}
}
