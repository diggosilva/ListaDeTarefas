//
//  TaskListViewModel.swift
//  ListaDeTarefas
//
//  Created by Diggo Silva on 13/05/26.
//

import Foundation

protocol TaskListViewModelProtocol {
    func addTask(_ task: Tarefa)
    func getTasks() -> [Tarefa]
    func alternateCompletion(task: Tarefa)
    func removeTask(task: Tarefa)
}

final class TaskListViewModel: TaskListViewModelProtocol {
    
    private var tasks: [Tarefa] = []
    private let repository: RepositoryProtocol
    
    init(repository: RepositoryProtocol = Repository()) {
        self.repository = repository
        tasks = repository.load()
    }
    
    func addTask(_ task: Tarefa) {
        tasks.append(task)
        repository.save(tasks)
    }
    
    func getTasks() -> [Tarefa] {
        return tasks
    }
    
    func alternateCompletion(task: Tarefa) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
            repository.save(tasks)
        }
    }
    
    func removeTask(task: Tarefa) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
            repository.save(tasks)
        }
    }
}
