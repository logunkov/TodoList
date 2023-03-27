//
//  LoginInteractorTests.swift
//  TodoListTests
//
//  Created by Constantin on 27.03.2023.
//

import XCTest
@testable import TodoList

final class LoginInteractorTests: XCTestCase {

	private let worker = LoginWorkerSpy()
	private let presenter = LoginPresenterSpy()

	func test_login_withValidRequest_shouldLoggedIn() {
		let sut = makeSut()
		let request = LoginModels.Request(login: "validEmail", password: "validPass")

		sut.login(request: request)

		XCTAssertTrue(worker.isCalledLogin, "Не вызван worker.login(:)")
		XCTAssertTrue(presenter.isCalledPresent, "Не вызван  presenter.present(:)")
	}
}

// MARK: - Private
private extension LoginInteractorTests {
	func makeSut() -> LoginInteractor {
		LoginInteractor(worker: worker, presenter: presenter)
	}
}
