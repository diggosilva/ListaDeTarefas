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
}

final class TaskListViewModel: TaskListViewModelProtocol {
    
    private var tasks: [Tarefa] = [
        Tarefa(title: "Comprar pão", priority: .high, date: Date()),
        Tarefa(title: "Academia", priority: .medium, date: Date().addingTimeInterval(3600)),
        Tarefa(title: "Estudar Swift", priority: .high, date: Date().addingTimeInterval(86400)),
        Tarefa(title: "Lavar o carro", priority: .low, date: Date())
    ]
    
    func numberOfRows() -> Int {
        return tasks.count
    }
    
    func taskForRow(at index: Int) -> Tarefa {
        return tasks[index]
    }
}
