//
//  LoginViewController.swift
//  ToDoList
//
//  Created by Constantin on 22.02.2023.
//

import UIKit
#if DEBUG
import SwiftUI
#endif

/// Протокол для LoginViewController.
protocol ILoginViewController: AnyObject {
	func render(viewModel: LoginModels.ViewModel)
}

/// ViewController для Login.
final class LoginViewController: UIViewController {

	// MARK: - Internal Properties

	var interactor: ILoginInteractor?
	var router: ILoginRouter?

	// MARK: - Private Properties

	private let mainView: ILoginView

	// MARK: - Life Cycle

	init(mainView: ILoginView) {
		self.mainView = mainView
		super.init(nibName: nil, bundle: nil)
		self.mainView.delegate = self
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func loadView() {
		view = mainView
	}
}

// MARK: - ILoginViewDelegate

extension LoginViewController: ILoginViewDelegate {
	func login() {
		if let email = mainView.loginText, let password = mainView.passText {
			let request = LoginModels.Request(login: email, password: password)
			interactor?.login(request: request)
		}
	}
}

// MARK: - ILoginViewController

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

// MARK: - PreviewProvider

#if DEBUG
struct ViewControllerProvider: PreviewProvider {
	static var previews: some View {
		Group {
			LoginViewController(mainView: LoginView()).preview()
		}
	}
}
#endif
