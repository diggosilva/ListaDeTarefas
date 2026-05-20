//
//  Tarefa.swift
//  ListaDeTarefas
//
//  Created by Diggo Silva on 13/05/26.
//

import UIKit

enum TaskPriority: Int, Codable {
    case low = 0
    case medium = 1
    case high = 2
    
    var color: UIColor {
        switch self {
        case .low: return .systemYellow
        case .medium: return .systemOrange
        case .high: return .systemRed
        }
    }
}

struct Tarefa: Identifiable, Codable {
    let id: String
    let title: String
    var isCompleted: Bool = false
    let priority: TaskPriority
    let date: Date
}
