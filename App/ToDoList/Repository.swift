//
//  Repository.swift
//  ToDoList
//
//  Created by Constantin on 15.02.2023.
//

import TaskManagerPackage

/// Протокол для TaskRepositoryStub.
protocol ITaskRepository {

	func getTasks() -> [Task]
}

/// Заглушка репозиторий.
final class TaskRepositoryStub: ITaskRepository {

	/// Создаем список всех заданий.
	/// - Returns: Массив заданий.
//	func getTasks() -> [Task] {
//		var taskList = [Task]()
//
//		for index in 1...9 {
//			let isImportantTask = Bool.random()
//
//			if isImportantTask {
//				let priority = ImportantTask.Priority.allCases.randomElement() ?? .low
//				let task = ImportantTask(name: "Task № \(index)", priority: priority)
//				taskList.append(task)
//			} else {
//				taskList.append(RegularTask(name: "Task №\(index)"))
//			}
//		}
//
//		taskList.forEach { task in
//			task.isCompleted = Bool.random()
//		}
//
//		return taskList
//	}

	func getTasks() -> [Task] {
		[
			ImportantTask(name: "Оплатить телефон", priority: .high, isCompleted: false),
			ImportantTask(name: "Купить яйца", priority: .medium, isCompleted: true),
			RegularTask(name: "Выбросить коробки", isCompleted: false),
			ImportantTask(name: "Оплатить учебу", priority: .high, isCompleted: true),
			RegularTask(name: "Разобрать шкаф", isCompleted: false),
			ImportantTask(name: "Зайти на почту за письмом", priority: .low, isCompleted: false),
			RegularTask(name: "Помыть посуду", isCompleted: true),
			ImportantTask(name: "Оплатить интернет", priority: .high, isCompleted: false),
			ImportantTask(name: "Купить масло", priority: .medium, isCompleted: false),
			RegularTask(name: "Помыть зимнюю обувь", isCompleted: false)
		]
	}
}
