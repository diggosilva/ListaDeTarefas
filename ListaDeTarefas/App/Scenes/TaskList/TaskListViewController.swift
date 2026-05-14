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
    }
    
    private func configDataSourcesAndDelegates() {
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
    }
}

extension TaskListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let task = viewModel.taskForRow(at: indexPath.row)
        
        var content = cell.defaultContentConfiguration()
        content.text = task.title
        content.secondaryText = "\(task.date)\n\(task.id)"
        
        cell.contentConfiguration = content
        return cell
    }
}

extension TaskListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
