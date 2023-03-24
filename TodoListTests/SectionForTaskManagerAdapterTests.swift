//
//  SectionForTaskManagerAdapterTests.swift
//  ToDoListTests
//
//  Created by Constantin on 19.03.2023.
//

import XCTest

final class SectionForTaskManagerAdapterTests: XCTestCase {

	func test_getSections_shouldReturnTwoSections() {
		let sut = makeSUT()

		let sections = sut.getSections()

		XCTAssertEqual(sections.count, 2, "Количество секций больше или меньше, чем 2")
	}

	func test_getSectionIndex_shouldReturnIndex() {
		let sut = makeSUT()

		let uncompletedSectionIndex = sut.getSectionIndex(section: .uncompleted)
		let completedSectionIndex = sut.getSectionIndex(section: .completed)

		XCTAssertEqual(uncompletedSectionIndex, 0, "Неверный номер секции № 0")
		XCTAssertEqual(completedSectionIndex, 1, "Неверный номер секции № 1")
	}

	func test_getSection_shouldReturnSections() {
		let sut = makeSUT()

		let uncompletedSection = sut.getSection(forIndex: 0)
		let completedSection = sut.getSection(forIndex: 1)

		XCTAssertEqual(uncompletedSection, .uncompleted, "Неверная секция - uncompleted")
		XCTAssertEqual(completedSection, .completed, "Неверная секция - completed")
	}

	func test_getTasksForSection_shouldReturnCompletedTasks() {
		let sut = makeSUT()

		let uncompletedTasks = sut.getTasksForSection(section: .uncompleted)
		let completedTasks = sut.getTasksForSection(section: .completed)

		uncompletedTasks.forEach { task in
			XCTAssertEqual(task.isCompleted, false, "Секция невыполненные задания, содержит выполенную задачу")
		}
		completedTasks.forEach { task in
			XCTAssertEqual(task.isCompleted, true, "Секция выполненные задания, содержит невыполенную задачу")
		}
	}

	// сложный тесть
	func test_taskSectionAndIndex_shouldReturnFirstCompletedTaskSectionAndIndex() {
		let sut = makeSUT()

		guard let completedTask = taskManager().allTasks().first else { return }
		guard let uncompletedTask = taskManager().allTasks().last else { return }
		guard let (sectionCompletedTasks, indexCompletedTasks) =
				sut.taskSectionAndIndex(task: completedTask) else { return }
		guard let (sectionUncompletedTasks, indexUncompletedTasks) =
				sut.taskSectionAndIndex(task: uncompletedTask) else { return }

		XCTAssertEqual(sectionUncompletedTasks, .uncompleted, "Неверная секция - CURRENT TASKS")
		XCTAssertEqual(indexUncompletedTasks, 0, "Неверный номер секции CURRENT TASKS")
		XCTAssertEqual(sectionCompletedTasks, .completed, "Неверная секция - COMPLETED TASKS")
		XCTAssertEqual(indexCompletedTasks, 1, "Неверный номер секции COMPLETED TASKS")
	}
}

// MARK: - Private
private extension SectionForTaskManagerAdapterTests {

	func makeSUT() -> SectionForTaskManagerAdapter {
		SectionForTaskManagerAdapter(taskManager: taskManager())
	}

	func taskManager() -> TaskManager {
		let taskManager = TaskManager()
		let completedTask = RegularTask(name: "RegularTask", isCompleted: true)
		let uncompletedTask = ImportantTask(name: "ImportantTask", priority: .high)
		taskManager.addTasks(tasks: [completedTask, uncompletedTask])
		return taskManager
	}
}
