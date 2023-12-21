//
//  TodoListScreenObject.swift
//  TodoListUITests
//
//  Created by Constantin on 21.12.2023.
//

import XCTest

/// Класс сцены списка заданий - объекта тестирования. Задаем элементы и возможности задавать параметры ввода и кликов.
class TodoListScreenObject: BaseScreenObject {

	// MARK: - Private properties

	private lazy var tableView = app.tables[AccessibilityIdentifier.TodoListScene.tableView]

	// MARK: - ScreenObject Methods

	/// Проверяем является ли сцена той, которую тестируем.
	/// - Returns: Возвращаем самы сцену для возможности продолжить цепочку вызовов.
	@discardableResult
	func isTodoListScreen() -> Self {
		assert(tableView, [.exists])

		return self
	}

	/// Получаем элемент в виде секции таблицы
	/// - Parameter title: Заголовок секции
	/// - Returns: Возвращаем элемент сцены.
	@discardableResult
	func getTableSectionWith(_ title: String) -> XCUIElement {
		tableView.staticTexts[title]
	}

	/// Получаем элемент в виде строки таблицы
	/// - Parameter identity: Идентификатор строки
	/// - Returns: Возвращаем элемент сцены.
	@discardableResult
	func getTableCellWith(_ identity: String) -> XCUIElement {
		tableView.cells[identity]
	}
}
