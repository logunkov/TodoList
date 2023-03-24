//
//  ITaskManager.swift
//  ToDoList
//
//  Created by Constantin on 21.02.2023.
//

/// Протокол для TaskManager.
public protocol ITaskManager {

	/// Список всех заданий.
	/// - Returns: Массив заданий.
	func allTasks() -> [Task]

	/// Список выполненных заданий.
	/// - Returns: Массив заданий.
	func completedTasks() -> [Task]

	/// Список заданий для выполнения.
	/// - Returns: Массив заданий.
	func uncompletedTasks() -> [Task]

	/// Добавление нового задания.
	/// - Parameter task: Задание.
	func addTask(task: Task)

	/// Добавление перечня заданий.
	/// - Parameter tasks: Массив заданий.
	func addTasks(tasks: [Task])
}

extension TaskManager: ITaskManager {}
