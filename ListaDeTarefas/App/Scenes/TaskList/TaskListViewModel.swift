//
//  TaskListViewModel.swift
//  ListaDeTarefas
//
//  Created by Diggo Silva on 13/05/26.
//

import Foundation

protocol TaskListViewModelProtocol {
    func numberOfRows() -> Int
    func taskForRow(at index: Int) -> Tarefa
    func addTask(_ task: Tarefa)
    func getTasks() -> [Tarefa]
}

final class TaskListViewModel: TaskListViewModelProtocol {
    
    private var tasks: [Tarefa] = []
    private let repository: RepositoryProtocol
    
    init(repository: RepositoryProtocol = Repository()) {
        self.repository = repository
        tasks = repository.load()
    }
    
    func numberOfRows() -> Int {
        return tasks.count
    }
    
    func taskForRow(at index: Int) -> Tarefa {
        return tasks[index]
    }
    
    func addTask(_ task: Tarefa) {
        tasks.append(task)
        repository.save(tasks)
    }
    
    func getTasks() -> [Tarefa] {
        return tasks
    }
}
