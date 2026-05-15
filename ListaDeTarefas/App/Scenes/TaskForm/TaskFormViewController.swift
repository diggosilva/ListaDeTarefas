//
//  TaskFormViewController.swift
//  ListaDeTarefas
//
//  Created by Diggo Silva on 14/05/26.
//

import UIKit

protocol TaskFormViewControllerDelegate: AnyObject {
    func addTask(task: Tarefa)
}

class TaskFormViewController: UIViewController {
    
    weak var delegate: TaskFormViewControllerDelegate?
    
    private let contentView = TaskFormView()
    private let viewModel: TaskFormViewModelProtocol
    
    init(viewModel: TaskFormViewModelProtocol = TaskFormViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        configDataSourcesAndDelegates()
    }
    
    private func configNavigationBar() {
        navigationItem.title = "Nova Tarefa"
    }
    
    private func configDataSourcesAndDelegates() {
        contentView.delegate = self
    }
}

extension TaskFormViewController: TaskFormViewDelegate {
    func didTapAddButton(title: String, priority: TaskPriority.RawValue) {
        let task = viewModel.addTask(title: title, priority: priority)
        delegate?.addTask(task: task)
        navigationController?.popViewController(animated: true)
    }
}
