//
//  MockLoginWorkerResults.swift
//  TodoListTests
//
//  Created by Constantin on 21.12.2023.
//

import Foundation

enum MockLoginWorkerResults {
	enum Valid {
		static let login = ""
		static let pass = ""
	}

	enum Invalid {
		static let login = "odmen"
		static let pass = "pass"
	}
}
