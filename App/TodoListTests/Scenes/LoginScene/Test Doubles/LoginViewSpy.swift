//
//  LoginViewSpy.swift
//  TodoListTests
//
//  Created by Constantin on 12.04.2023.
//

import UIKit

final class LoginViewSpy: UIView, ILoginView {

	// MARK: - Internal Properties

	weak var delegate: ILoginViewDelegate?
	var loginText: String? = "validEmail"
	var passText: String? = "validPass"
}
