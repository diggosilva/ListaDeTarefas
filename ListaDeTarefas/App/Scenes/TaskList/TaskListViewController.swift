//
//  TaskListViewController.swift
//  ListaDeTarefas
//
//  Created by Diggo Silva on 12/05/26.
//

import UIKit

class TaskListViewController: UIViewController {
    
    private let contentView = TaskListView()
    private let viewModel = TaskListViewModel()
    
    override func loadView() { view = contentView }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        configDataSourcesAndDelegates()
    }
    
    private func configNavigationBar() {
        navigationItem.title = "Tarefas"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddTask))
    }
    
    private func configDataSourcesAndDelegates() {
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
    }
    
    @objc private func didTapAddTask() {
        let taskFormVC = TaskFormViewController()
        taskFormVC.delegate = self
        navigationController?.pushViewController(taskFormVC, animated: true)
    }
}

extension TaskListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.identifier, for: indexPath) as? TaskCell else { return UITableViewCell() }
        let task = viewModel.taskForRow(at: indexPath.row)
        cell.configure(task: task)
        return cell
    }
}

extension TaskListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TaskListViewController: TaskFormViewControllerDelegate {
    func addTask(task: Tarefa) {
        viewModel.addTask(task)
        contentView.tableView.reloadData()
    }
}
