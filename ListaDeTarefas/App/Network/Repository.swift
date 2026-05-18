//
//  Repository.swift
//  ListaDeTarefas
//
//  Created by Diggo Silva on 17/05/26.
//

import Foundation

protocol RepositoryProtocol {
    func save(_ tarefas: [Tarefa])
    func load() -> [Tarefa]
}

class Repository: RepositoryProtocol {
    
    private let taskKey = "task_key"
    private let userDefaults = UserDefaults.standard
    
    func save(_ tarefas: [Tarefa]) {
        if let data = try? JSONEncoder().encode(tarefas) {
            userDefaults.set(data, forKey: taskKey)
        }
    }
    
    func load() -> [Tarefa] {
        if let data = userDefaults.data(forKey: taskKey) {
            if let decoded = try? JSONDecoder().decode([Tarefa].self, from: data) {
                return decoded
            }
        }
        return []
    }
}
