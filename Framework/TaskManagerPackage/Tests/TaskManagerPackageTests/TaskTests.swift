//
//  TaskTests.swift
//  TodoListTests
//
//  Created by Constantin on 17.03.2023.
//

import XCTest
@testable import TaskManagerPackage

final class TaskTests: XCTestCase {

	func test_initialization_propertyIsCompleteShouldBeFalse() {
		let sut = makeSut()

		XCTAssertEqual(sut.name, "Task", "Неверное имя задание")
		XCTAssertFalse(sut.isCompleted, "Неверно создается класс")
	}

	func test_isComplete_setTrue_propertyIsCompleteShouldBeTrue() {
		let sut = makeSut()

		sut.isCompleted.toggle()

		XCTAssertTrue(sut.isCompleted, "Невозможно завершить задание")
	}
}

// MARK: - Private
private extension TaskTests {

	func makeSut() -> Task {
		Task(name: "Task")
	}
}
