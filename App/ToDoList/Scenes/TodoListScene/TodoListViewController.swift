//
//  TodoListViewController.swift
//  ToDoList
//
//  Created by Constantin on 12.02.2023.
//

import UIKit

/// Протокол для TodoListViewController.
protocol ITodoListViewController: AnyObject {
	func render(viewModel: TodoListModel.ViewModel)
}

/// ViewController для TodoList.
final class TodoListViewController: UITableViewController {

	// MARK: - Types

	enum AccessibilityIdentifier: String {
		case todoListTableView
	}

	// MARK: - Internal Properties

	var viewModel: TodoListModel.ViewModel = TodoListModel.ViewModel(tasksBySections: [])
	var interactor: ITodoListInteractor?

	// MARK: - Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
		interactor?.fetchData()
	}

	// MARK: - Private Methods

	private func setupView() {

		tableView.accessibilityIdentifier = AccessibilityIdentifier.todoListTableView.rawValue
		tableView.backgroundColor = Theme.backgroundColor
		view.backgroundColor = Theme.backgroundColor
	}

	private func contentConfigurationCell(
		isDone: Bool,
		contentConfiguration: UIListContentConfiguration
	) -> UIListContentConfiguration {
		var contentConfiguration = contentConfiguration

		if isDone {
			contentConfiguration.image = UIImage(systemName: "checkmark.circle")
			contentConfiguration.imageProperties.tintColor = Theme.mainColor
		} else {
			contentConfiguration.image = UIImage(systemName: "circle")
			contentConfiguration.imageProperties.tintColor = Theme.black
		}

		return contentConfiguration
	}
}

// MARK: - ITodoListViewController

extension TodoListViewController: ITodoListViewController {
	/// Отрисовка.
	func render(viewModel: TodoListModel.ViewModel) {
		self.viewModel = viewModel
		tableView.reloadData()
	}
}

// MARK: - UITableViewDataSource

extension TodoListViewController {
	override func numberOfSections(in tableView: UITableView) -> Int {
		viewModel.tasksBySections.count
	}

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		viewModel.tasksBySections[section].title
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let section = viewModel.tasksBySections[section]
		return section.tasks.count
	}

	override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
		guard let header = view as? UITableViewHeaderFooterView else { return }
		header.textLabel?.textColor = Theme.black
		header.textLabel?.frame = header.bounds
		header.textLabel?.textAlignment = .center
		header.contentView.backgroundColor = Theme.backgroundColor
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let tasks = viewModel.tasksBySections[indexPath.section].tasks
		let taskData = tasks[indexPath.row]
		let cell = UITableViewCell()
		var contentConfiguration = cell.defaultContentConfiguration()

		switch taskData {
		case .importantTask(let task):
			let redText = [NSAttributedString.Key.foregroundColor: Theme.accentColor]
			let taskText = NSMutableAttributedString(string: "\(task.priority)", attributes: redText)
			taskText.append(NSAttributedString(string: task.name))

			contentConfiguration.attributedText = taskText
			contentConfiguration.secondaryText = task.deadLine
			contentConfiguration.secondaryTextProperties.color = Theme.black

			contentConfiguration = contentConfigurationCell(isDone: task.isDone, contentConfiguration: contentConfiguration)

		case .regularTask(let task):
			contentConfiguration.text = task.name

			contentConfiguration = contentConfigurationCell(isDone: task.isDone, contentConfiguration: contentConfiguration)
		}

		cell.tintColor = Theme.accentColor
		contentConfiguration.secondaryTextProperties.font = UIFont.systemFont(ofSize: 16)
		contentConfiguration.textProperties.font = UIFont.boldSystemFont(ofSize: 19)
		cell.backgroundColor = Theme.backgroundColor
		cell.contentConfiguration = contentConfiguration

		return cell
	}
}

// MARK: - UITableViewDelegate

extension TodoListViewController {
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		interactor?.didTaskSelected(atIndex: TodoListModel.Request.TaskSelected(indexPath: indexPath))
	}
}
