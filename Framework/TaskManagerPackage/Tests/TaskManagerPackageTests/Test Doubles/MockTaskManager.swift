//
//  MockTaskManager.swift
//  TodoListTests
//
//  Created by Constantin on 24.03.2023.
//

import XCTest
@testable import TaskManagerPackage

final class MockTaskManager: ITaskManager {
	static let highImportantTask = ImportantTask(name: "highImportantTask", priority: .high)
	static let mediumImportantTask = ImportantTask(name: "mediumImportantTask", priority: .medium)
	static let lowImportantTask = ImportantTask(name: "lowImportantTask", priority: .low)
	static let completedRegularTask = RegularTask(name: "completedRegularTask", isCompleted: true)
	static let uncompletedRegularTask = RegularTask(name: "regularTask")

	static let completedHighImportantTask = {
		var completedHighImportantTask = ImportantTask(name: "highImportantTask", priority: .high)
		completedHighImportantTask.isCompleted = true
		return completedHighImportantTask
	}()

	static let completedMediumImportantTask = {
		var completedMediumImportantTask = ImportantTask(name: "mediumImportantTask", priority: .medium)
		completedMediumImportantTask.isCompleted = true
		return completedMediumImportantTask
	}()

	func allTasks() -> [Task] {
		[
			MockTaskManager.highImportantTask,
			MockTaskManager.lowImportantTask,
			MockTaskManager.completedRegularTask,
			MockTaskManager.mediumImportantTask,
			MockTaskManager.uncompletedRegularTask
		]
	}

	func completedTasks() -> [Task] {
		[
			MockTaskManager.completedRegularTask,
			MockTaskManager.completedHighImportantTask,
			MockTaskManager.completedMediumImportantTask
		]
	}

	func uncompletedTasks() -> [Task] {
		[
			MockTaskManager.highImportantTask,
			MockTaskManager.lowImportantTask,
			MockTaskManager.mediumImportantTask,
			MockTaskManager.uncompletedRegularTask
		]
	}

	func addTasks(tasks: [Task]) {
		fatalError("Not implimented!")
	}

	func addTask(task: Task) {
		fatalError("Not implimented!")
	}
}
