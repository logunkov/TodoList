//
//  LoginViewController.swift
//  ToDoList
//
//  Created by Constantin on 22.02.2023.
//

import UIKit

/// Протокол для LoginViewController.
protocol ILoginViewController: AnyObject {
	func render(viewModel: LoginModels.ViewModel)
}

/// ViewController для Login.
final class LoginViewController: UIViewController {

	@IBOutlet private weak var textFieldLogin: UITextField!
	@IBOutlet private weak var textFieldPass: UITextField!

	var interactor: ILoginInteractor?
	var router: ILoginRouter?

	var loginText: String {
		get {
			textFieldLogin.text ?? ""
		}

		set {
			textFieldLogin.text = newValue
		}
	}

	var passText: String {
		get {
			textFieldPass.text ?? ""
		}

		set {
			textFieldPass.text = newValue
		}
	}

	@IBAction private func buttonLogin(_ sender: Any) {
		login()
	}

	func login() {
		let request = LoginModels.Request(login: loginText, password: passText)
		interactor?.login(request: request)
	}
}

extension LoginViewController: ILoginViewController {

	/// Отрисовка.
	func render(viewModel: LoginModels.ViewModel) {
		switch viewModel {
		case .success:
			router?.routeToTodoList()
		case .failure(let massenge):
			router?.showError(message: massenge)
		}
	}
}
