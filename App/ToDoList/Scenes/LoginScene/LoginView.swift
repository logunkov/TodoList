//
//  LoginView.swift
//  TodoList
//
//  Created by Constantin on 12.04.2023.
//

import PinLayout
import UIKit

protocol ILoginView: UIView {
	var delegate: ILoginViewDelegate? { get set }
	var loginText: String? { get }
	var passText: String? { get }
}

protocol ILoginViewDelegate: AnyObject {
	func login()
}

/// Основная view для `LoginViewController`
final class LoginView: UIView, ILoginView {

	// MARK: - Types

	enum AccessibilityIdentifier: String {
		case loginIconImageView
		case loginTextField
		case passwordTextField
		case loginButton
	}

	// MARK: - Internal Properties

	weak var delegate: ILoginViewDelegate?

	var loginText: String? {
		loginTextField.text
	}

	var passText: String? {
		passwordTextField.text
	}

	// MARK: - Private Properties

	private lazy var iconImageView = createIconImageView()
	private lazy var loginTextField = createLoginTextField()
	private lazy var passwordTextField = createPasswordTextField()
	private lazy var loginButton = createLoginButton()

	// MARK: - Life Cycle

	init() {
		super.init(frame: .zero)
		backgroundColor = .white
		setupUI()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		setupLayout()
	}

	// MARK: - Private Methods

	private func setupUI() {
		addSubviews([loginTextField, passwordTextField, loginButton, iconImageView])
	}

	// MARK: - Actions

	@objc private func loginAction(_ sender: UIButton) {
		delegate?.login()
	}
}

// MARK: - Subviews Creation

extension LoginView {
	private func createIconImageView() -> UIImageView {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		// swiftlint:disable:next image_name_initialization
		imageView.image = UIImage(named: "icon")
		imageView.accessibilityIdentifier = AccessibilityIdentifier.loginIconImageView.rawValue
		return imageView
	}

	private func createLoginTextField() -> UITextField {
		let textField = createTextField()
		textField.placeholder = "login"
		textField.accessibilityIdentifier = AccessibilityIdentifier.loginTextField.rawValue
		return textField
	}

	private func createPasswordTextField() -> UITextField {
		let textField = createTextField()
		textField.placeholder = "password"
		textField.accessibilityIdentifier = AccessibilityIdentifier.passwordTextField.rawValue
		return textField
	}

	private func createLoginButton() -> UIButton {
		let button = UIButton()

		button.configuration = .filled()
		button.configuration?.cornerStyle = .medium
		button.configuration?.baseBackgroundColor = .systemBlue
		button.configuration?.title = "login"
		button.layer.cornerRadius = Sizes.cornerRadius
		button.accessibilityIdentifier = AccessibilityIdentifier.loginButton.rawValue

		button.addTarget(self, action: #selector(loginAction), for: .touchUpInside)

		return button
	}

	private func createTextField() -> UITextField {
		let textField = UITextField()
		textField.backgroundColor = .white
		textField.textColor = .black
		textField.borderStyle = .roundedRect
		textField.layer.cornerRadius = Sizes.cornerRadius
		return textField
	}
}

// MARK: - Layout

extension LoginView {
	private func setupLayout() {
		iconImageView.pin
			.hCenter()
			.vCenter(-200)
			.height(Sizes.Large.width)
			.width(Sizes.Large.width)
		loginTextField.pin
			.left(Sizes.Padding.double)
			.right(Sizes.Padding.double)
			.below(of: iconImageView)
			.marginVertical(Sizes.Padding.normal)
			.height(Sizes.Large.height)
		passwordTextField.pin
			.left(Sizes.Padding.double)
			.right(Sizes.Padding.double)
			.below(of: loginTextField)
			.marginVertical(Sizes.Padding.normal)
			.height(Sizes.Large.height)
		loginButton.pin
			.left(Sizes.Padding.double)
			.right(Sizes.Padding.double)
			.below(of: passwordTextField)
			.marginVertical(Sizes.Padding.normal)
			.height(Sizes.Large.height)
	}
}
