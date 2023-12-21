//
//  Task.swift
//  ToDoList
//
//  Created by Constantin on 12.02.2023.
//

import Foundation

/// Задание, для ведения списка дел.
public class Task {

	/// Наименование задания.
	public let name: String

	/// Состояние задания -- выполнено ли задание.
	public var isCompleted: Bool

	/// Задание.
	/// - Parameters:
	///   - name: Название задания.
	///   - isCompleted: выполнено задание?
	public init (name: String, isCompleted: Bool = false) {
		self.name = name
		self.isCompleted = isCompleted
	}
}

/// Обычное задание.
public final class RegularTask: Task {}

/// Важное задание с приоритетом.
public final class ImportantTask: Task {

	/// Приоритет задания. Приоритет влияет на крайний срок выполнения задания.
	public enum Priority: Int, CaseIterable {
		/// Низкий приоритет. На выполнение задания с низким приоритетом, отводится 3 дня.
		case low
		/// Средний приоритет. На выполнение задания со средним приоритетом, отводится 2 дня.
		case medium
		/// Высокий приоритет. На выполнение задания с высоким приоритетом, отводится 1 день.
		case high
	}

	private let createDate: Date

	/// Приоритет задания.
	public var taskPriority: Priority

	/// Крайний срок выполнения задания.
	public var deadLine: Date {
		let today = Date()
		switch taskPriority {
		case .low:
			return Calendar.current.date(byAdding: .day, value: 3, to: today) ?? today
		case .medium:
			return Calendar.current.date(byAdding: .day, value: 2, to: today) ?? today
		case .high:
			return Calendar.current.date(byAdding: .day, value: 1, to: today) ?? today
		}
	}

	public init(name: String, priority: Priority, createDate: Date = Date(), isCompleted: Bool = false) {
		self.taskPriority = priority
		self.createDate = createDate
		super.init(name: name)
	}
}

extension Task: Equatable {
	public static func == (lhs: Task, rhs: Task) -> Bool {
		lhs === rhs
	}
}
