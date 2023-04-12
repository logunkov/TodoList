//
//  TaskManagerTests.swift
//  ToDoListTests
//
//  Created by Constantin on 19.03.2023.
//

import XCTest
@testable import TaskManagerPackage

final class TaskManagerTests: XCTestCase {

	private let completedTask = Task(name: "completedTask", isCompleted: true)
	private let uncompletedTask = Task(name: "uncompletedTask", isCompleted: false)

	func test_allTasks_shouldBe2Tasks() {
		let sut = makeSut()

		sut.addTasks(tasks: [completedTask, uncompletedTask])

		XCTAssertTrue(
			sut.allTasks().contains(completedTask),
			"В списке все задания, не оказалось завершенной задачи"
		)
		XCTAssertTrue(
			sut.allTasks().contains(uncompletedTask),
			"В списке все задания, не оказалось незавершенной задачи"
		)
	}

	func test_completedTasks_add1CompletedAnd1Uncompleted_shouldBe1Task() {
		let sut = makeSut()

		sut.addTask(task: completedTask)

		XCTAssertTrue(
			sut.completedTasks().contains(completedTask),
			"В списке завершенных задач, не оказалось завершенной задачи"
		)
	}

	func test_uncompletedTasks_add1CompletedAnd1Uncompleted_shouldBe1Task() {
		let sut = makeSut()

		sut.addTask(task: uncompletedTask)

		XCTAssertTrue(
			sut.uncompletedTasks().contains(uncompletedTask),
			"В списке незавершенных задач, не оказалось незавершенной задачи"
		)
	}

	func test_addTask_add1Task_shouldBe1Task() {
		let sut = makeSut()

		sut.addTask(task: completedTask)
		sut.addTask(task: uncompletedTask)

		XCTAssertTrue(
			sut.allTasks().contains(completedTask),
			"В списке все задания, не оказалось завершенной задачи"
		)
		XCTAssertTrue(
			sut.allTasks().contains(uncompletedTask),
			"В списке все задания, не оказалось незавершенной задачи"
		)
	}

	func test_addTasks_add2Tasks_shouldBe2Tasks() {
		let sut = makeSut()

		sut.addTasks(tasks: [completedTask, uncompletedTask])

		XCTAssertTrue(
			sut.allTasks().contains(completedTask),
			"В списке все задания, не оказалось завершенной задачи"
		)
		XCTAssertTrue(
			sut.allTasks().contains(uncompletedTask),
			"В списке все задания, не оказалось незавершенной задачи"
		)
	}

	func test_removeTask_add2TasksAndRemove1Task_shouldBe1Task() {
		let sut = makeSut()

		sut.addTasks(tasks: [completedTask, uncompletedTask])
		sut.removeTask(task: uncompletedTask)

		XCTAssertTrue(
			sut.allTasks().contains(completedTask),
			"В списке все задания, не оказалось завершенной задачи"
		)
		XCTAssertFalse(
			sut.allTasks().contains(uncompletedTask),
			"В списке все задания, не оказалось незавершенной задачи"
		)
	}
}

// MARK: - Private extension

private extension TaskManagerTests {

	func makeSut() -> TaskManager {
		let sut = TaskManager()
		sut.addTasks(tasks: [completedTask, uncompletedTask])
		return sut
	}
}
