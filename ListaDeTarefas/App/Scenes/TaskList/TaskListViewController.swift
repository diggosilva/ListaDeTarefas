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
    private var dataSource: UITableViewDiffableDataSource<Int, String>?
    
    override func loadView() { view = contentView }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        configDataSourcesAndDelegates()
        updateSnapshot()
    }
    
    private func configNavigationBar() {
        navigationItem.title = "Tarefas"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddTask))
    }
    
    private func configDataSourcesAndDelegates() {
        configDataSource()
        contentView.tableView.delegate = self
    }
    
    private func configDataSource() {
        dataSource = UITableViewDiffableDataSource<Int, String>(tableView: contentView.tableView) { [weak self] tableView, indexPath, taskID in
            guard let self = self,
                  let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.identifier, for: indexPath) as? TaskCell else { return UITableViewCell() }
            
            if let task = self.viewModel.getTasks().first(where: { $0.id == taskID }) {
                cell.configure(task: task)
            }
            return cell
        }
    }
    
    private func updateSnapshot(animated: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
        snapshot.appendSections([0])
        
        let tasks = viewModel.getTasks()
        let ids = tasks.map({ $0.id })
        
        snapshot.appendItems(ids, toSection: 0)
        
        if #available(iOS 15.0, *) {
            snapshot.reconfigureItems(ids)
        } else {
            snapshot.reloadItems(ids)
        }
        
        dataSource?.apply(snapshot, animatingDifferences: animated)
    }
    
    @objc private func didTapAddTask() {
        let taskFormVC = TaskFormViewController()
        taskFormVC.delegate = self
        navigationController?.pushViewController(taskFormVC, animated: true)
    }
}

extension TaskListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let taskID = dataSource?.itemIdentifier(for: indexPath),
              let task = viewModel.getTasks().first(where: { $0.id == taskID }) else { return }
        viewModel.alternateCompletion(task: task)
        updateSnapshot()
    }
}

extension TaskListViewController: TaskFormViewControllerDelegate {
    func addTask(task: Tarefa) {
        viewModel.addTask(task)
        updateSnapshot()
    }
}
