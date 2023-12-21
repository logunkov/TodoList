//
//  LoginScreenObject.swift
//  TodoListUITests
//
//  Created by Constantin on 21.12.2023.
//

import XCTest

/// Класс сцены авторизации - объекта тестирования. Задаем элементы и возможности задавать параметры ввода и кликов.
class LoginScreenObject: BaseScreenObject {

	// MARK: - Private properties

	private lazy var textFieldLogin = app.textFields[AccessibilityIdentifier.LoginScene.textFieldLogin]
	private lazy var textFieldPass = app.textFields[AccessibilityIdentifier.LoginScene.textFieldPass]
	private lazy var loginButton = app.buttons[AccessibilityIdentifier.LoginScene.buttonLogin]

	// MARK: - ScreenObject Methods

	/// Проверяем является ли сцена той, которую тестируем.
	/// - Returns: Возвращаем самы сцену для возможности продолжить цепочку вызовов.
	@discardableResult
	func isLoginScreen() -> Self {
		assert(textFieldLogin, [.exists])
		assert(textFieldPass, [.exists])
		assert(loginButton, [.exists])

		return self
	}

	/// Устанавливаем текст для выбранного текстового окна ввода.
	/// - Parameter login: Текст логина
	/// - Returns: Возвращаем самы сцену для возможности продолжить цепочку вызовов.
	@discardableResult
	func set(login: String) -> Self {
		assert(textFieldLogin, [.exists])
		textFieldLogin.tap()
		textFieldLogin.typeText(login)

		return self
	}

	/// Устанавливаем текст для выбранного текстового окна ввода.
	/// - Parameter password: Текст пароля
	/// - Returns: Возвращаем самы сцену для возможности продолжить цепочку вызовов.
	@discardableResult
	func set(password: String) -> Self {
		assert(textFieldPass, [.exists])
		textFieldPass.tap()
		textFieldPass.typeText(password)

		return self
	}

	/// Находим кнопку и нажимаем по ней
	/// - Returns: Возвращаем самы сцену для возможности продолжить цепочку вызовов.
	@discardableResult
	func login() -> Self {
		assert(loginButton, [.exists])
		loginButton.tap()

		return self
	}
}
