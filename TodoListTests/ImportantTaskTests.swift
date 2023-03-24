//
//  ImportantTaskTests.swift
//  ToDoListTests
//
//  Created by Constantin on 19.03.2023.
//

import XCTest

final class ImportantTaskTests: XCTestCase {

	func test_initialization_propertyIsCompleteShouldBeFalse() {
		let sut = makeSut()

		XCTAssertEqual(sut.name, "ImportantTask", "Неверное имя задание")
		XCTAssertFalse(sut.isCompleted, "Неверно создается класс")
	}

	func test_isComplete_setTrue_propertyIsCompleteShouldBeTrue() {
		let sut = makeSut()

		sut.isCompleted.toggle()

		XCTAssertTrue(sut.isCompleted, "Невозможно завершить задание")
	}

	func test_createImportantTask_withHighPriority_deadlineShouldBeIn1Day() {
		let sut = makeSut()

		sut.taskPriority = .high
		let sutDay = Calendar.current.component(.day, from: sut.deadLine)
		guard let targetDate = Calendar.current.date(byAdding: .day, value: 1, to: Date()) else { return }
		let targetDay = Calendar.current.component(.day, from: targetDate)

		XCTAssertEqual(sutDay, targetDay, "Неверный срок выполнения задания - 1 день")
	}

	func test_createImportantTask_withMediumPriority_deadlineShouldBeIn2Days() {
		let sut = makeSut()

		sut.taskPriority = .medium
		let sutDay = Calendar.current.component(.day, from: sut.deadLine)
		guard let targetDate = Calendar.current.date(byAdding: .day, value: 2, to: Date()) else { return }
		let targetDay = Calendar.current.component(.day, from: targetDate)

		XCTAssertEqual(sutDay, targetDay, "Неверный срок выполнения задания - 2 дня")
	}

	func test_createImportantTask_withLowPriority_deadlineShouldBeIn3Days() {
		let sut = makeSut()

		sut.taskPriority = .low
		let sutDay = Calendar.current.component(.day, from: sut.deadLine)
		guard let targetDate = Calendar.current.date(byAdding: .day, value: 3, to: Date()) else { return }
		let targetDay = Calendar.current.component(.day, from: targetDate)

		XCTAssertEqual(sutDay, targetDay, "Неверный срок выполнения задания - 3 дня")
	}
}

// MARK: - Private
private extension ImportantTaskTests {

	func makeSut() -> ImportantTask {
		ImportantTask(name: "ImportantTask", priority: .low)
	}
}
