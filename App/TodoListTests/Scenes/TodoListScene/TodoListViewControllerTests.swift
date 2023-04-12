//
//  TodoListViewControllerTests.swift
//  TodoListTests
//
//  Created by Constantin on 12.04.2023.
//

import XCTest
@testable import TodoList

final class TodoListViewControllerTests: XCTestCase {

	// MARK: - Private Properties

	private let interactor = TodoListInteractorSpy()

	// MARK: - Internal Methods

	func test_viewDidLoad_shouldFetchTasksForTableView() {
		let sut = makeSut()
		sut.viewDidLoad()

		XCTAssertTrue(interactor.isFetchDataCalled, "interactor.fetchData не был вызван")
	}

	func test_render_shouldDisplayTasksFromViewModel() {
		let sut = makeSut()
		let tableViewSpy = TodoListTableViewSpy()
		let viewModel = makeViewModel()

		sut.tableView = tableViewSpy
		sut.tableView.dataSource = sut
		sut.render(viewModel: viewModel)

		XCTAssertTrue(tableViewSpy.isCalledReloadData, "Not started tableView.reloadData")

	}

	func test_render_shouldDisplayTasksFromViewModelNumberOfSections() {
		let sut = makeSut()
		let tableViewSpy = TodoListTableViewSpy()
		let viewModel = makeViewModel()

		sut.tableView = tableViewSpy
		sut.tableView.dataSource = sut
		sut.render(viewModel: viewModel)

		XCTAssertEqual(tableViewSpy.numberOfSections, viewModel.tasksBySections.count, "Неверное количество секций")
	}

	func test_render_shouldDisplayTasksFromViewModelNumberOfRowsZero() {
		let sut = makeSut()
		let tableViewSpy = TodoListTableViewSpy()
		let viewModel = makeViewModel()

		sut.tableView = tableViewSpy
		sut.tableView.dataSource = sut
		sut.render(viewModel: viewModel)

		XCTAssertEqual(
			tableViewSpy.numberOfRows(inSection: 0),
			viewModel.tasksBySections[0].tasks.count,
			"Неверное количество элементов в первой секции"
		)

	}

	func test_render_shouldDisplayTasksFromViewModelNumberOfRowsOne() {
		let sut = makeSut()
		let tableViewSpy = TodoListTableViewSpy()
		let viewModel = makeViewModel()

		sut.tableView = tableViewSpy
		sut.tableView.dataSource = sut
		sut.render(viewModel: viewModel)

		XCTAssertEqual(
			tableViewSpy.numberOfRows(inSection: 1),
			viewModel.tasksBySections[1].tasks.count,
			"Неверное количество элементов во второй секции"
		)
	}
}

// MARK: - Private extension

private extension TodoListViewControllerTests {
	func makeSut() -> TodoListViewController {
		let viewController = TodoListViewController()
		viewController.interactor = interactor
		return viewController
	}

	func makeViewModel() -> TodoListModel.ViewModel {
		TodoListModel.ViewModel(
			tasksBySections: [
				.init(
					title: "Completed",
					tasks: [
						.regularTask(.init(name: "RegularTask1", isDone: true)),
						.regularTask(.init(name: "RegularTask2", isDone: true)),
						.regularTask(.init(name: "RegularTask3", isDone: true))
					]
				),
				.init(
					title: "Uncompleted",
					tasks: [
						.regularTask(.init(name: "RegularTask4", isDone: false))
					]
				)
			]
		)
	}
}
