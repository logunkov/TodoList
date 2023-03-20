//
//  TaskManager.swift
//  ToDoList
//
//  Created by Constantin on 12.02.2023.
//

/// ITaskManager
protocol ITaskManager {
	
	func allTasks() -> [Task]
	func completedTasks() -> [Task]
	func uncompletedTasks() -> [Task]
	func addTasks(tasks: [Task])
}

/// TaskManager
final class TaskManager: ITaskManager {
	
	private var taskList = [Task]()
	
	/// Get all tasks
	/// - Returns: [Task]
	public func allTasks() -> [Task] {
		taskList
	}
	
	/// Get all copleted tasks
	/// - Returns: [Task]
	public func completedTasks() -> [Task] {
		taskList.filter {$0.isCompleted}
	}
	
	/// Get all uncopleted tasks
	/// - Returns: [Task]
	public func uncompletedTasks() -> [Task] {
		taskList.filter {!$0.isCompleted}
	}
	
	/// Add tasks
	/// - Parameter tasks: [Task]
	public func addTasks(tasks: [Task]) {
		taskList.append(contentsOf: tasks)
	}
	
	/// Remove task
	/// - Parameter task: [Task]
	public func removeTask(task: Task) {
		taskList.removeAll{ $0 === task }
	}
}