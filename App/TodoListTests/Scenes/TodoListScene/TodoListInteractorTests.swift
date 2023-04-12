//
//  TodoListInteractorTests.swift
//  TodoListTests
//
//  Created by Constantin on 12.04.2023.
//

 import XCTest
 @testable import TodoList

 final class TodoListInteractorTests: XCTestCase {

	// MARK: - Private Properties

	private let presenter = TodoListPresenterSpy()

	// MARK: - Internal Methods

	func test_fetchData_shouldBe2Sections() {
		let sut = makeSut()

		sut.fetchData()
		let fetchResponseData = presenter.response.data

		XCTAssertTrue(presenter.isCalledPresent, "Presenter не сработал")
		XCTAssertEqual(fetchResponseData.count, 2, "Количество секций не равно двум")
	}

	func test_fetchData_completeSectionShouldContainsTwoTasks() {
		let sut = makeSut()

		sut.fetchData()
		let fetchResponseData = presenter.response.data
		guard let completedTasks = fetchResponseData.first(where: { $0.section == .completed })?.tasks else { return }

		XCTAssertEqual(completedTasks.count, 3, "Количество завершеных заданий не равно трем")
	}

	func test_fetchData_unCompleteSectionShouldContainsFourTasks() {
		let sut = makeSut()

		sut.fetchData()
		let fetchResponseData = presenter.response.data
		guard let unCompletedTasks = fetchResponseData.first(where: { $0.section == .uncompleted })?.tasks else { return }

		XCTAssertEqual(unCompletedTasks.count, 4, "Количество НЕзавершеных заданий не равно четыре")
	}

	func test_didTaskSelected_withValidRequest_shouldCallPresenter() {
		let sut = makeSut()

		let indexPath = IndexPath(row: 0, section: 0)
		let request = TodoListModel.Request.TaskSelected(indexPath: indexPath)
		sut.didTaskSelected(atIndex: request)

		XCTAssertTrue(presenter.isCalledPresent, "He вызван presenter.present (:)")
	}
 }

// MARK: - Private extension

 private extension TodoListInteractorTests {
	func makeSut() -> TodoListInteractor {
		let mockTaskManager = MockTaskManager()
		let sectionTaskManager = SectionForTaskManagerAdapter(taskManager: mockTaskManager)

		return TodoListInteractor(
			sectionManager: sectionTaskManager,
			presenter: presenter
		)
	}
 }
