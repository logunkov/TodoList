//
//  Repository.swift
//  ToDoList
//
//  Created by Constantin on 15.02.2023.
//

/// Протокол для TaskRepositoryStub.
protocol ITaskRepository {

	func getTasks() -> [Task]
}

/// Заглушка репозиторий.
final class TaskRepositoryStub: ITaskRepository {

	/// Создаем список всех заданий.
	/// - Returns: Массив заданий.
	func getTasks() -> [Task] {
		var taskList = [Task]()

		for index in 1...9 {
			let isImportantTask = Bool.random()

			if isImportantTask {
				let priority = ImportantTask.Priority.allCases.randomElement() ?? .low
				let task = ImportantTask(name: "Task № \(index)", priority: priority)
				taskList.append(task)
			} else {
				taskList.append(RegularTask(name: "Task №\(index)"))
			}
		}

		taskList.forEach { task in
			task.isCompleted = Bool.random()
		}

		return taskList
	}
}
