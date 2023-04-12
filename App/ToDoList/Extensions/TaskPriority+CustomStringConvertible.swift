//
//  TaskPriority+CustomStringConvertible.swift
//  TodoList
//
//  Created by Constantin on 12.04.2023.
//

import Foundation
import TaskManagerPackage

extension ImportantTask.Priority: CustomStringConvertible {
	/// Строковое представление ImportantTask.
	public var description: String {
		switch self {
		case .low:
			return "!"
		case .medium:
			return "!!"
		case .high:
			return "!!!"
		}
	}
}
