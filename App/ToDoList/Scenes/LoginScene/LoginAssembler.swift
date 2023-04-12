//
//  LoginAssembler.swift
//  ToDoList
//
//  Created by Constantin on 10.03.2023.
//

import UIKit

/// Assebler для входа в систему.
final class LoginAssembler {

	/// Сборка.
	func assembly() -> UIViewController {
		let view = LoginView()
		let viewController = LoginViewController(mainView: view)

		let presenter = LoginPresenter(viewController: viewController)
		let worker = LoginWorker()
		let interactor = LoginInteractor(worker: worker, presenter: presenter)
		viewController.interactor = interactor

		return viewController
	}
}
