//
//  BaseScreenObject.swift
//  TodoListUITests
//
//  Created by Constantin on 21.12.2023.
//

import XCTest

/// Базовый класс для создания сцены - объекта тестирования.
class BaseScreenObject {

	// MARK: - Dependencies

	let app: XCUIApplication

	// MARK: - Private properties

	private static let defaultTimeout: TimeInterval = 2

	// MARK: - Private elements

	private lazy var alert = app.alerts.firstMatch
	private lazy var alertButton = alert.buttons.firstMatch

	private lazy var navigationBar = app.navigationBars.firstMatch
	private lazy var navigationBarButton = navigationBar.buttons.firstMatch
	private lazy var navigationBarTitle = navigationBar.staticTexts.firstMatch

	// MARK: - Initialization

	init(app: XCUIApplication) {
		self.app = app
	}

	// MARK: - ScreenObject Methods

	/// Определяем доступность элемента интерфейса для тестирования.
	/// - Parameters:
	///   - element: Элемент интерфейса.
	///   - predicates: Тип поиска
	///   - timeout: Время ожидания отклика. По умолчанию 2 секунды.
	/// - Returns: Возвращаем самы сцену для возможности продолжить цепочку вызовов.
	@discardableResult
	func assert(_ element: XCUIElement, _ predicates: [Predicate], timeout: TimeInterval = defaultTimeout) -> Self {
		let expectation = XCTNSPredicateExpectation(
			predicate: NSPredicate(format: predicates.map { $0.format }.joined(separator: " AND ")),
			object: element
		)

		guard XCTWaiter.wait(for: [expectation], timeout: timeout) == .completed else {
			XCTFail("[\(self)] Элемент \(element.description) не соответствует ожиданию: \(predicates.map { $0.format })")
			return self
		}
		return self
	}

	/// Проверка нажатия пальцем на  элемент интерфейса. Проваливается, если элемент в данный момент скрыт или недоступен.
	/// - Parameters:
	///   - element: Элемент интерфейса.
	///   - timeout: Время ожидания отклика. По умолчанию 2 секунды.
	/// - Returns: Возвращаем самы сцену для возможности продолжить цепочку вызовов.
	@discardableResult
	func tap(_ element: XCUIElement, timeout: TimeInterval = BaseScreenObject.defaultTimeout) -> Self {
		assert(element, [.isHittable], timeout: timeout)
		element.tap()

		return self
	}

	/// Подтверждение нажатия  на кнопку Назад навигатор бара.
	/// - Parameter timeout: Время ожидания отклика. По умолчанию 2 секунды.
	/// - Returns: Возвращаем самы сцену для возможности продолжить цепочку вызовов.
	@discardableResult
	func back(timeout: TimeInterval = BaseScreenObject.defaultTimeout) -> Self {
		tap(navigationBarButton, timeout: timeout)

		return self
	}
}

// MARK: - Navigation Bar

extension BaseScreenObject {

	/// Получить заголовок навигайшн бара.
	func getTitle() -> String {
		assert(navigationBarTitle, [.exists])
			.navigationBarTitle
			.title
	}
}

// MARK: - Alerts

extension BaseScreenObject {

	/// Получить всплывающее окошко оповещения.
	/// - Returns: Элемент интерфейса
	func getAlert() -> XCUIElement {
		alert
	}

	/// Показано всплывающее окошко оповещения.
	func isShowingAlert() {
		assert(alert, [.exists])
	}

	/// Не показано всплывающее окошко оповещения.
	func isNotShowingAlert() {
		assert(alert, [.doesNotExist])
	}
}

// MARK: - Keyboard

/// Управление клавиатурой.
extension BaseScreenObject {
	enum Lang: String {
		case eng = "English (US)"
		case rus = "Русская"
		case emoji = "Emoji"
	}

	/// Установка клавиатуры на нужный язык.
	/// - Parameter language: язык.
	func setKeyboard(language: Lang) {
		app.buttons["Next keyboard"].press(forDuration: 0.5)
		app.tables["InputSwitcherTable"].staticTexts[language.rawValue].tap()
	}
}
