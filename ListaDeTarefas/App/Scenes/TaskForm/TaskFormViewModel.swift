//
//  TaskFormViewModel.swift
//  ListaDeTarefas
//
//  Created by Diggo Silva on 14/05/26.
//

import Foundation

protocol TaskFormViewModelProtocol {
    func addTask(title: String, priority: TaskPriority.RawValue) -> Tarefa
}

final class TaskFormViewModel: TaskFormViewModelProtocol {
    func addTask(title: String, priority: TaskPriority.RawValue) -> Tarefa {
        let newTarefa = Tarefa(id: UUID().uuidString, title: title, priority: TaskPriority(rawValue: priority) ?? .low, date: Date())
        return newTarefa
    }
}
