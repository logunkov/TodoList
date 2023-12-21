//
//  TodoListSceneUITests.swift
//  TodoListUITests
//
//  Created by Constantin on 21.12.2023.
//

import XCTest

final class TodoListSceneUITests: XCTestCase {

	// MARK: - Private properties

	private let cellIdentity = "cell-0-0"
	private let firstCellLabel = "!!!Оплатить телефон"
	private let secondCellLabel = "!!!Оплатить интернет"

	private var app: XCUIApplication! // swiftlint:disable:this implicitly_unwrapped_optional

	// MARK: - Lifecycle

	override func setUp() {
		super.setUp()

		app = XCUIApplication()
		app.launchArguments = ["-launchWithTodoListScene"]
		app.launch()
	}

	override func tearDown() {
		app = nil

		super.tearDown()
	}

	// MARK: - Internal Methods

	func test_tableView_shouldContainCompleteSection() {
		let sut = makeSut()

		let isCompeteSection = sut.isTodoListScreen()
			.getTableSectionWith(L10n.TodoList.Section.complete)
			.exists

		XCTAssertTrue(isCompeteSection, "Таблица не содержит список завершенных")
	}

	func test_tableView_shouldContainUnCompleteSection() {
		let sut = makeSut()

		let isUnCompeteSection = sut.isTodoListScreen()
			.getTableSectionWith(L10n.TodoList.Section.current)
			.exists

		XCTAssertTrue(isUnCompeteSection, "Таблица не содержит список не завершенных")
	}

	func test_tableView_firstRow_shouldBeContainLabel() {
		let sut = makeSut()

		let cell = sut.isTodoListScreen().getTableCellWith(cellIdentity)

		XCTAssert(cell.staticTexts[firstCellLabel].exists, "Первая строка таблица не соответствует заявленной")
	}

	func test_tableViewDidSelectRowAt_firstRow_shouldBeChangeLabel() {
		let sut = makeSut()

		let cell = sut.isTodoListScreen().getTableCellWith(cellIdentity)

		cell.tap()

		XCTAssert(cell.staticTexts[secondCellLabel].exists, "После нажатия по первой строке таблица не изменилась")
	}
}

// MARK: - Private methods

private extension TodoListSceneUITests {
	func makeSut() -> TodoListScreenObject {
		TodoListScreenObject(app: app)
	}
}
