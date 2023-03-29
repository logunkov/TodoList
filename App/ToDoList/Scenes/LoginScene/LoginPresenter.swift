//
//  LoginPresenter.swift
//  ToDoList
//
//  Created by Constantin on 22.02.2023.
//

/// Протокол для LoginPresenter.
protocol ILoginPresenter {
	func present(response: LoginModels.Response)
}

/// Presenter для Login.
final class LoginPresenter: ILoginPresenter {

	private weak var viewController: ILoginViewController?

	init(viewController: ILoginViewController?) {
		self.viewController = viewController
	}

	/// Ответ входа в систему.
	/// - Parameter response: Данные входа в систему.
	func present(response: LoginModels.Response) {
		let viewModel: LoginModels.ViewModel = response.success ? .success : .failure("Access denied")
		viewController?.render(viewModel: viewModel)
	}
}
