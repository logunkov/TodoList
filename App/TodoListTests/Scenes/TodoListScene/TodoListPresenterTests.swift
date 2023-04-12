//
//  TodoListPresenterTests.swift
//  TodoListTests
//
//  Created by Constantin on 12.04.2023.
//

 import XCTest
 @testable import TodoList

 final class TodoListPresenterTests: XCTestCase {

	// MARK: - Private Properties

	private let viewController = TodoListViewControllerSpy()

	// MARK: - Internal Methods

	func test_present_withValidRequest_shouldBeRenderViewWithTwoSections() {
		let sut = makeSut()
		let response = TodoListModel.Response(data: makeSutData())

		sut.present(response: response)
		let renderedDataSectionCount = viewController.viewModel.tasksBySections.count

		XCTAssertTrue(viewController.isCalledRender, "viewController.render не был вызван")
		XCTAssertEqual(renderedDataSectionCount, 2, "Количество секций во View не равно двум")
	}
 }

// MARK: - Private extension

 private extension TodoListPresenterTests {
	func makeSut() -> TodoListPresenter {
		TodoListPresenter(viewController: viewController)
	}

	func makeSutData() -> [TodoListModel.Response.SectionWithTasks] {
		let sectionUnCompleted = TodoListModel.Response.SectionWithTasks(section: .uncompleted, tasks: [
			MockTaskManager.highImportantTask,
			MockTaskManager.mediumImportantTask,
			MockTaskManager.lowImportantTask,
			MockTaskManager.uncompletedRegularTask
		])

		let sectionCompleted = TodoListModel.Response.SectionWithTasks(section: .completed, tasks: [
			MockTaskManager.completedHighImportantTask,
			MockTaskManager.completedRegularTask,
			MockTaskManager.completedMediumImportantTask
		])

		return[sectionUnCompleted, sectionCompleted]
	}
 }
