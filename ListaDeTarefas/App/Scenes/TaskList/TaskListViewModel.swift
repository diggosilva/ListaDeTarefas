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
}

final class TaskListViewModel: TaskListViewModelProtocol {
    
    private var tasks: [Tarefa] = []
    
    func numberOfRows() -> Int {
        return tasks.count
    }
    
    func taskForRow(at index: Int) -> Tarefa {
        return tasks[index]
    }
    
    func addTask(_ task: Tarefa) {
        tasks.append(task)
    }
}
