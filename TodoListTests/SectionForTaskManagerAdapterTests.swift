//
//  SectionForTaskManagerAdapterTests.swift
//  ToDoListTests
//
//  Created by Constantin on 19.03.2023.
//

import XCTest
import TaskManagerPackage

final class SectionForTaskManagerAdapterTests: XCTestCase {

	func test_getSections_shouldReturnTwoSectionsUncompletedAndCompleted() {
		let sut = makeSUT()

		let sections = sut.getSections()

		XCTAssertEqual(sections.first, .uncompleted, "Неверная секция - uncompleted")
		XCTAssertEqual(sections.last, .completed, "Неверная секция - completed")
	}

	func test_getSectionIndex_withCompletedSection_shouldReturnCompletedSection() {
		let sut = makeSUT()

		let completedSectionIndex = sut.getSectionIndex(section: .completed)

		XCTAssertEqual(completedSectionIndex, 1, "Неверный номер для секции - completed")
	}

	func test_getSection_forIndexOne_shouldReturnCompletedSection() {
		let sut = makeSUT()

		let completedSection = sut.getSection(forIndex: 1)

		XCTAssertEqual(completedSection, .completed, "Неверная секция - completed")
	}

	func test_getTasksForSection_withCompletedSection_shouldReturnCompletedSection() {
		let sut = makeSUT()

		let completedTasks = sut.getTasksForSection(section: .completed)

		completedTasks.forEach { task in
			XCTAssertEqual(task.isCompleted, true, "Секция выполненные задания, содержит невыполенную задачу")
		}
	}

	func test_taskSectionAndIndex_withCompletedTask_shouldReturnCompletedSectionAndFirstIndex() {
		let sut = makeSUT()

		let mockTaskManager = MockTaskManager()
		guard let completedTask = mockTaskManager.completedTasks().first else { return }
		guard let (sectionCompletedTasks, indexCompletedTasks) =
				sut.taskSectionAndIndex(task: completedTask) else { return }

		XCTAssertEqual(sectionCompletedTasks, .completed, "Неверная секция - completed")
		XCTAssertEqual(indexCompletedTasks, 1, "Неверный номер для секции - completed")
	}
}

// MARK: - Private
private extension SectionForTaskManagerAdapterTests {

	func makeSUT() -> SectionForTaskManagerAdapter {
		let mockTaskManager = MockTaskManager()
		let sut = SectionForTaskManagerAdapter(taskManager: mockTaskManager)
		return sut
	}
}
