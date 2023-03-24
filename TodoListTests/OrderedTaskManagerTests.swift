//
//  OrderedTaskManagerTests.swift
//  ToDoListTests
//
//  Created by Constantin on 19.03.2023.
//

import XCTest

final class OrderedTaskManagerTests: XCTestCase {

	func test_allTasks_shouldBe5TaskOrderedByPriority() {
		let sut = makeSut()
		let validResultTasks: [Task] = [
			MockTaskManager.highImportantTask,
			MockTaskManager.mediumImportantTask,
			MockTaskManager.lowImportantTask,
			MockTaskManager.uncompletedRegularTask,
			MockTaskManager.completedRegularTask
		]

		let resultTasks = sut.allTasks()

		XCTAssertEqual(resultTasks.count, 5, "При выборке всех задач, ожидалось, что их будет 5 штук.")
		XCTAssertEqual(
			resultTasks,
			validResultTasks,
			"При выборке всех задач, порядок задач не совпал с сортировкой по приоритету."
		)
	}

	func test_completedTasks_shouldBeAllCompletedTaskOrderedByPriority() {
		let sut = makeSut()
		let validResultTasks: [Task] = [
			MockTaskManager.completedHighImportantTask,
			MockTaskManager.completedMediumImportantTask,
			MockTaskManager.completedRegularTask
		]

		let resultTasks = sut.completedTasks()

		XCTAssertEqual(resultTasks.count, 3, "При выборке завершенных задач, ожидалось, что их будет 3 штука.")
		XCTAssertEqual(
			resultTasks,
			validResultTasks,
			"При выборке завершенных задач, порядок задач не совпал с сортировкой по приоритету."
		)
	}

	func test_uncompletedTasks_shouldBeAllUncompletedTaskOrderedByPriority() {
		let sut = makeSut()
		let validResultTasks: [Task] = [
			MockTaskManager.highImportantTask,
			MockTaskManager.mediumImportantTask,
			MockTaskManager.lowImportantTask,
			MockTaskManager.uncompletedRegularTask
		]

		let resultTasks = sut.uncompletedTasks()

		XCTAssertEqual(resultTasks.count, 4, "При выборке незавершенных задач, ожидалось, что их будет 4 штуки.")
		XCTAssertEqual(
			resultTasks,
			validResultTasks,
			"При выборке незавершенных задач, порядок задач не совпал с сортировкой по приоритету."
		)
	}
}

// MARK: - Private
private extension OrderedTaskManagerTests {

	func makeSut() -> OrderedTaskManager {
		let mockTaskManager = MockTaskManager()
		let sut = OrderedTaskManager(taskManager: mockTaskManager)
		return sut
	}
}
